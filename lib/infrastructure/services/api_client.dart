import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:m_dual_inventario/config/constant/environment.dart';
import 'package:m_dual_inventario/config/constant/key_app_preferences.dart';
import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/conteo_inventario/conteo_inventario.dart';
import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
import 'package:m_dual_inventario/domain/entities/tomas_inv_almacen/toma_inventario.dart';
import 'package:m_dual_inventario/domain/entities/obtener_datos/obtener_datos/obtener_datos.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/infrastructure/mappers/local_warehouse/almacen_x_local_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/search_inventory_take/conteo_inventario_mapper/conteo_inventario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/group_mapper/group_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/line_mapper/line_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/subgroup_mapper/subgroup_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/unit_measure_mapper/unit_measure_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/configuration_data/warehouse_mapper/warehouse_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/inventory_take/tomas_inventario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/mappers/login/usuario_mapper.dart';
import 'package:m_dual_inventario/infrastructure/models/local_warehouse/almacen_x_local_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/count_inventory_model/count_inventory_model.dart';
import 'package:m_dual_inventario/infrastructure/models/search_inventory_takes/product_model/product_model.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/configuration_datas/obtener_datos_model.dart';
import 'package:m_dual_inventario/infrastructure/models/inventory_take/tomas_inventario_model.dart';
import 'package:m_dual_inventario/infrastructure/models/user/usuario_model.dart';
import 'package:m_dual_inventario/shared/app_preferences.dart';
import 'package:m_dual_inventario/shared/dio_service/dio_client_service.dart';
import 'package:m_dual_inventario/shared/helpers/extensions/datetime_extensions.dart';

class ApiCliente extends DioClientService {
  ApiCliente()
      : super(urlBase: Environment.urlApi, interceptores: [
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              final xkey =
                  await AppPreference.getValue<String>(KeyAppPreferences.token);
              if (xkey != null) {
                options.headers['sKey'] = xkey;
              }
              final nickUsuario = await AppPreference.getValue<String>(
                  KeyAppPreferences.nickUsuario);
              final password =
                  await AppPreference.getValue<String>(KeyAppPreferences.clave);
              if (nickUsuario != null && password != null) {
                options.headers['Authorization'] =
                    'Basic ${base64Encode(latin1.encode('$nickUsuario:$password'))}';
              }
              handler.next(options);
            },
          )
        ]);

  Future<String> obtenerVersionDualInventario() async {
    try {
      final response = await get(
        'InventarioMovil/Version',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      return response.data.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<Usuario> login(String nickUsuario, String contrasena) async {
    try {
      final response = await get(
        'usuario/login',
        options: Options(headers: {
          'Authorization':
              'Basic ${base64Encode(latin1.encode('$nickUsuario:$contrasena'))}',
          'Accept': '*/*'
        }),
      );

      final responseUsuarioModel = UsuarioModel.fromJson(response.data);
      final listaHeader = response.headers.map["x-response-key"];
      String xkey = "";
      if (listaHeader != null && listaHeader.isNotEmpty) {
        xkey = listaHeader[0];
        await AppPreference.setKeyValue(KeyAppPreferences.token, xkey);
      }
      final usuario = UsuarioMapper.mapearUsuario(responseUsuarioModel);

      return usuario;
    } catch (e) {
      rethrow;
    }
  }

  Future<ObtenerDatosApp> obtenerDatosApp(String codigoLocal) async {
    try {
      final response = await get(
        'usuario/obtenerDatosApp?pCloc=$codigoLocal',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final responseObtenerDatosAppModel =
          ObtenerDatosModel.fromJson(response.data);

      final unidadMedida = responseObtenerDatosAppModel.listUnitMeasure
              ?.map((unitMeasure) =>
                  UnitMeasureMapper.mapearUnitMeasure(unitMeasure))
              .toList() ??
          [];
      final lineas = responseObtenerDatosAppModel.listLine
          .map((line) => LineMapper.mapearListLine(line))
          .toList();
      final grupos = responseObtenerDatosAppModel.listGroup
          .map((group) => GroupMapper.mapearListGroup(group))
          .toList();
      final subgrupos = responseObtenerDatosAppModel.listSubGroup
          .map((subGroup) => SubgroupMapper.mapearListSubgroup(subGroup))
          .toList();
      final almacenes = responseObtenerDatosAppModel.listWarehouse
          .map((warehouse) => WarehouseMapper.mapearListWarehouse(warehouse))
          .toList();

      final obtenerDatosApp = ObtenerDatosApp(
        unidadmedida: unidadMedida,
        lineas: lineas,
        grupos: grupos,
        subgrupos: subgrupos,
        almacenes: almacenes,
      );

      return obtenerDatosApp;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AlmacenXLocal>> obtenerDatosAlmacen(
      int codigoLocal, int codigoUsuario) async {
    try {
      final response = await get(
        'tomaInventario/listarActivosPorLocalUsuario/',
        queryParameters: {
          'pCloc': codigoLocal,
          'pCusr': codigoUsuario,
        },
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<dynamic> responseModel = response.data;
      final almacenesMapper = responseModel
          .map((json) => AlmacenXLocalMapper.mapearAlmacenxlocal(
              AlmacenXLocalModel.fromJson(json)))
          .toList();

      return almacenesMapper;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TomasInventario>> obtenerUltimasTomas(int codigoAlmacen) async {
    try {
      final response = await get(
        'tomaInventario/listarUltimasTomaInventarioPorAlmacen/$codigoAlmacen',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<dynamic> responseModel = response.data;
      final listarUltimasTomasMapper = responseModel
          .map((json) => TomasInventarioMapper.mapearListarUltimasToma(
              TomasInventarioModel.fromJson(json)))
          .toList();

      return listarUltimasTomasMapper;
    } catch (e) {
      rethrow;
    }
  }

  Future<TomasInventario> buscarTomaInventario(int codigoTomaInventario) async {
    try {
      final response = await get(
        'tomaInventario/buscarTomaInventario/$codigoTomaInventario',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final tomasInventarioModel = TomasInventarioModel.fromJson(response.data);

      final tomaInventario =
          TomasInventarioMapper.mapearListarUltimasToma(tomasInventarioModel);

      return tomaInventario;
    } catch (e) {
      rethrow;
    }
  }

  Future<TomasInventario> obtenerTomaConResultados(
      int codigoTomaInventario) async {
    try {
      final response = await get(
        'tomaInventario/obtenerTomaConResultados/$codigoTomaInventario',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final tomasInventarioModel = TomasInventarioModel.fromJson(response.data);

      final tomaInventario =
          TomasInventarioMapper.mapearListarUltimasToma(tomasInventarioModel);

      return tomaInventario;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> buscarProductos({
    required int codigoAlmacen,
    DateTime? fechaToma,
    int? codigoLinea,
    int? codigoGrupo,
    int? codigoSubgrupo,
    String? nombreProducto,
    String? ubicacion,
    String? codigoBarra,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'pCalm': codigoAlmacen.toString(),
      };

      if (codigoLinea != null) {
        queryParams['pClin'] = codigoLinea.toString();
      }
      if (codigoGrupo != null) {
        queryParams['pCgru'] = codigoGrupo.toString();
      }
      if (codigoSubgrupo != null) {
        queryParams['pCsgr'] = codigoSubgrupo.toString();
      }
      if (nombreProducto != null && nombreProducto.isNotEmpty) {
        queryParams['pNomb'] = nombreProducto;
      }
      if (ubicacion != null && ubicacion.isNotEmpty) {
        queryParams['pUbic'] = ubicacion;
      }
      if (codigoBarra != null && codigoBarra.isNotEmpty) {
        queryParams['pCodi'] = codigoBarra;
      }
      if (fechaToma != null) {
        final fechaFormateada = fechaToma.toIso8601String().split('T').first;
        queryParams['pFech'] = fechaFormateada;
      }

      final endpoint = fechaToma != null
          ? 'producto/buscarProductosPorAlmacenXFecha2'
          : 'producto/buscarProductosPorAlmacen2';

      final response = await get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<ProductModel> productos = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();

      return productos;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> guardarTomaInventario(TomasInventario tomaInventario) async {
    try {
      final model = TomasInventarioMapper.mapearAModelo(tomaInventario);
      final response = await post<int>(
        'tomaInventario',
        data: jsonEncode(model.toJson()),
        options: Options(
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data!;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Usuario>> listaUsuariosPorAlmacen(int codigoAlmacen) async {
    try {
      final response = await get(
        'usuario/listarPorAlmacen',
        queryParameters: {
          'pCalm': codigoAlmacen.toString(),
        },
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<dynamic> responseModel = response.data;
      final usuarioMapper = responseModel
          .map((json) =>
              UsuarioMapper.mapearUsuario(UsuarioModel.fromJson(json)))
          .toList();

      return usuarioMapper;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> guardarConteoInventario(ConteoInventario conteoInventario) async {
    try {
      // Modificar detalle al formato admitido por el servicio
      List<DetalleRecuentoInventario> nuevaListaDetalle = [];
      for (var detalle in conteoInventario.listaDetalleRecuentoInventario) {
        bool tieneLote = detalle.producto?.listaLotes?.isNotEmpty ?? false;

        if (!tieneLote) {
          // El detalle no tiene lote
          nuevaListaDetalle.add(detalle);
          continue;
        }

        // El detalle tiene lote
        // Recorre la lista de lotes
        for (var lote in detalle.producto!.listaLotes!) {
          final nuevoDetalle = detalle.copyWith(
              codigoLote: lote.codigo,
              cantidadStock: lote.stock,
              cantidadConteo: lote.cantidad);
          nuevaListaDetalle.add(nuevoDetalle);
        }
      }
      final model = ConteoInventarioMapper.mapearAConteoInventario(
          conteoInventario.copyWith(
              listaDetalleRecuentoInventario: nuevaListaDetalle));
      final response = await post<Map<String, dynamic>>(
        'conteoInventario',
        data: jsonEncode(model.toJson()),
        options: Options(
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data?['code'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ConteoInventario>> listarConteosAsignados({
    required int codigoAlmacen,
    required int codigoUsuario,
    required int codigoConteo,
    required DateTime fechaActualizacion,
  }) async {
    try {
      final fechaFormateada = fechaActualizacion.getStringFormat('yyyy-MM-dd');

      final response = await get(
        'conteoInventario/listarConteosAsignados2',
        queryParameters: {
          'pCalm': codigoAlmacen.toString(),
          'pCusr': codigoUsuario.toString(),
          'pCcon': codigoConteo.toString(),
          'pFech': fechaFormateada,
        },
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<ConteoInventario> conteos = (response.data as List)
          .map((json) => ConteoInventarioMapper.mapearConteoInventario(
                CountInventoryModel.fromJson(json),
              ))
          .toList();
      return conteos;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ConteoInventario>> buscarConteoPorCodigoConteo(int codeTI) async {
    try {
      final response = await get(
        'conteoInventario/listarConteosPorToma/$codeTI',
        options: Options(headers: {
          'Accept': '*/*',
        }),
      );

      final List<ConteoInventario> conteos = (response.data as List)
          .map((json) => ConteoInventarioMapper.mapearConteoInventario(
                CountInventoryModel.fromJson(json),
              ))
          .toList();

      return conteos;
    } catch (e) {
      rethrow;
    }
  }

  Future<ConteoInventario> actualizarStockConteo(
      int codigoConteoInventario) async {
    try {
      final response = await post<Map<String, dynamic>>(
        'actualizarStockConteo2',
        data: codigoConteoInventario,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      final conteo = ConteoInventarioMapper.mapearConteoInventario(
        CountInventoryModel.fromJson(response.data!),
      );

      // final ConteoInventario conteo2;

      // if (conteo.codigo == 15) {
      //   final listaDetalle = conteo.listaDetalleRecuentoInventario;
      //   List<DetalleRecuentoInventario> nuevoDetalle = [];
      //   for (DetalleRecuentoInventario item in listaDetalle) {
      //     if (item.codigoLote == null || item.codigoLote!.isEmpty) {
      //       // Si no tiene lote agregamos el detalle a la nueva lista
      //       nuevoDetalle.add(item);
      //       continue;
      //     }
      //     // tiene lote, procesamos para agrupar
      //     DetalleRecuentoInventario? detalleAgrupado = nuevoDetalle
      //         .where(
      //           (element) => element.codigoProducto == item.codigoProducto,
      //         )
      //         .firstOrNull;
      //     detalleAgrupado ??= item.copyWith();

      //     List<LotesEntidad> nuevaListadeLotes = [
      //       ...(detalleAgrupado.listaLotes ?? [])
      //     ];

      //     LotesEntidad nuevoLote = LotesEntidad(
      //         codigo: item.codigoLote!,
      //         fechaExpiracion: DateTime.now(),
      //         stock: item.cantidadStock);
      //     nuevaListadeLotes.add(nuevoLote);
      //     detalleAgrupado =
      //         detalleAgrupado.copyWith(listaLotes: nuevaListadeLotes);

      //     nuevoDetalle = [
      //       ...nuevoDetalle.where(
      //         (det) => det.codigoProducto != detalleAgrupado!.codigoProducto,
      //       ),
      //       detalleAgrupado
      //     ];
      //     // nuevoDetalle.add(detalleAgrupado);
      //   }
      //   conteo2 = conteo.copyWith(listaDetalleRecuentoInventario: nuevoDetalle);
      // } else {
      //   conteo2 = conteo;
      // }

      return conteo;
    } catch (e) {
      rethrow;
    }
  }
}
