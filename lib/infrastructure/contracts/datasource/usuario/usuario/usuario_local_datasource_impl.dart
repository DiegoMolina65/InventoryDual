import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:m_dual_inventario/domain/datasource/usuario/usuario/usuario_local_datasource.dart';
import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/infrastructure/persistences/app_database.dart';

class UsuarioLocalDatasourceImpl extends UsuarioLocalDatasource {
  final database = AppDatabase();

  @override
  Future<bool> guardarUsuario(Usuario usuario) async {
    try {
      await database.batch(
        (batch) {
          batch.insert(
            database.tblUsuario,
            TblUsuarioCompanion.insert(
              codigo: Value(usuario.codigo),
              nombre: usuario.nombre,
              codigoLocal: usuario.codigoLocal,
              nombreLocal: usuario.nombreLocal,
              codigoAlmacen: usuario.codigoAlmacen,
              usuario: usuario.usuario,
              contrasenia: usuario.contrasenia,
              codigoListaPrecios: usuario.codigoListaPrecios,
              codigoMoneda: usuario.codigoMoneda,
              valorMoneda: usuario.valorMoneda,
              nombreClientePredeterminado: usuario.nombreClientePredeterminado,
              codigoClientePredeterminado: usuario.codigoClientePredeterminado,
              esSupervisor: usuario.esSupervisor,
            ),
          );


          
        },
      );

      return true;
    } on InvalidDataException catch (ex) {
      if (kDebugMode) {
        print("Error EmpleadoLocalDatasourceImpl->guardarEmpleado: $ex");
      }
      throw Exception(
          "Error EmpleadoLocalDatasourceImpl->guardarEmpleado: ${ex.errors.entries.map((error) {
        return '${error.key.dartGetterName}: ${error.value.message}';
      })}");
    } catch (ex) {
      if (kDebugMode) {
        print("Error EmpleadoLocalDatasourceImpl->guardarEmpleado: $ex");
      }
      rethrow;
    }
  }

  @override
  Future<Usuario?> obtenerUsuario(int codigoUsuario) async {
    try {
      return await (database.select(database.tblUsuario)
            ..where(
              (tbl) => tbl.codigo.equals(codigoUsuario),
            ))
          .getSingleOrNull();
    } on InvalidDataException catch (ex) {
      if (kDebugMode) {
        print("Error UsuarioLocalDatasourceImpl->obtenerUsuario: $ex");
      }
      throw Exception(
          "Error UsuarioLocalDatasourceImpl->obtenerUsuario: ${ex.errors.entries.map((error) {
        return '${error.key.dartGetterName}: ${error.value.message}';
      })}");
    } catch (ex) {
      if (kDebugMode) {
        print("Error UsuarioLocalDatasourceImpl->obtenerUsuario: $ex");
      }
      rethrow;
    }
  }

  @override
  Future<bool> vaciar() async {
    try {
      database.transaction(() async {
        await (database.delete(database.tblUsuario)).go();
      });

      return true;
    } on InvalidDataException catch (ex) {
      if (kDebugMode) {
        print("Error UsuarioLocalDatasourceImpl->vaciar: $ex");
      }
      throw Exception(
          "Error UsuarioLocalDatasourceImpl->vaciar: ${ex.errors.entries.map((error) {
        return '${error.key.dartGetterName}: ${error.value.message}';
      })}");
    } catch (ex) {
      if (kDebugMode) {
        print("Error UsuarioLocalDatasourceImpl->vaciar: $ex");
      }
      rethrow;
    }
  }
}
