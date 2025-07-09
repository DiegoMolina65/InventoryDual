import 'package:m_dual_inventario/domain/entities/lotes/lotes.dart';
import 'package:m_dual_inventario/infrastructure/models/batch/batch_model.dart';

class BatchMapper {
  static LotesEntidad mapearLote(BatchModel batchModel) {
    return LotesEntidad(
        codigo: batchModel.code,
        fechaExpiracion: batchModel.expirationDate,
        stock: batchModel.stock,
        cantidad: batchModel.quantity);
  }

  static BatchModel mapearALote(LotesEntidad loteEntidad) {
    return BatchModel(
        code: loteEntidad.codigo,
        expirationDate: loteEntidad.fechaExpiracion,
        stock: loteEntidad.stock,
        quantity: loteEntidad.cantidad);
  }
}
