import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';
import 'package:m_dual_inventario/infrastructure/models/configuration_data/warehouse_model/warehouse_model.dart';

class WarehouseMapper {
    static Almacen mapearListWarehouse(
      WarehouseModel obtenerDatosModelListWarehouse) {
    return Almacen(
        codigo: obtenerDatosModelListWarehouse.code,
        nombre: obtenerDatosModelListWarehouse.name);
  }
}
