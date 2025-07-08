import 'package:m_dual_inventario/domain/entities/conteo/conteo_imagen/conteo_imagen.dart';
import 'package:m_dual_inventario/infrastructure/models/count/image_count/image_count_model.dart';

class ConteoImagenMapper {
  static ConteoImagen mapearConteoImagen(ImageCountModel model) {
    return ConteoImagen(
      codigoProducto: model.codeProduct,
      codigoConteoInventario: model.codeCountInventory,
      imagen: model.image,
      observacion: model.observation,
    );
  }

  static ImageCountModel mapearAConteoImagen(ConteoImagen entity) {
    return ImageCountModel(
      codeProduct: entity.codigoProducto,
      codeCountInventory: entity.codigoConteoInventario,
      image: entity.imagen,
      observation: entity.observacion,
    );
  }
}
