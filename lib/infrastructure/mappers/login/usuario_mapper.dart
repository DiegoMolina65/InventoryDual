import 'package:m_dual_inventario/domain/entities/usuario/usuario.dart';
import 'package:m_dual_inventario/infrastructure/models/user/usuario_model.dart';

class UsuarioMapper {
  static Usuario mapearUsuario(UsuarioModel usuarioModel) {
    return Usuario(
        codigo: usuarioModel.code,
        nombre: usuarioModel.name,
        codigoLocal: usuarioModel.localCode,
        nombreLocal: usuarioModel.localName,
        codigoAlmacen: usuarioModel.warehouseCode,
        usuario: usuarioModel.nick ?? '',
        contrasenia: usuarioModel.password ?? '',
        codigoListaPrecios: usuarioModel.priceListCode,
        codigoMoneda: usuarioModel.currencyCode,
        valorMoneda: usuarioModel.currencyValue,
        nombreClientePredeterminado: usuarioModel.nameDefaultCustomer ?? '',
        codigoClientePredeterminado: usuarioModel.codeDefaultCustomer,
        esSupervisor: usuarioModel.isSupervisor);
  }
}
