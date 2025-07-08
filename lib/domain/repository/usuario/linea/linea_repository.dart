import 'package:m_dual_inventario/domain/entities/obtener_datos/export_obtenerdatos.dart';

abstract class LineaRepository{
    Future<List<Linea>> obtenerLineas();
}