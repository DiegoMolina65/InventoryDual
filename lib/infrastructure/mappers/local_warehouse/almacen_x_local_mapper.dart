import 'package:m_dual_inventario/domain/entities/almacen_por_local/almacen_x_local.dart';
import 'package:m_dual_inventario/infrastructure/models/local_warehouse/almacen_x_local_model.dart';

class AlmacenXLocalMapper {
  static AlmacenXLocal mapearAlmacenxlocal(
      AlmacenXLocalModel almacenXLocalModel) {
    return AlmacenXLocal(
        codigo: almacenXLocalModel.code,
        nombre: almacenXLocalModel.name
      );
  }
}
