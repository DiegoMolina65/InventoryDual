// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:m_dual_inventario/domain/entities/buscar_tomas_inventario/detalle_recuento_inventario/detalle_recuento_inventario.dart';
// import 'package:m_dual_inventario/presentation/screens/assigned_counts/assigned_count_details_screen/provider/assigned_count_details_provider.dart';
// import 'package:m_dual_inventario/shared/helpers/extensions/validators_inputs.dart';
// import 'package:m_dual_inventario/shared/widgets/custom_textformfield/custom_textformfield_widget.dart';

// class ItemDetalleConteoContarView extends ConsumerWidget {
//   final DetalleRecuentoInventario detalleConteo;
//   final String descripcion;
//   final bool puedeEditar;
//   const ItemDetalleConteoContarView({
//     super.key,
//     required this.detalleConteo,
//     this.descripcion = "",
//     this.puedeEditar = true,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.blue.shade200, width: 1),
//           ),
//           child: Row(
//             children: [
//               Icon(Icons.info_outline, color: Colors.blue.shade600, size: 18),
//               Expanded(
//                 child: Text(
//                   'Detalle: $descripcion',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.blue.shade800,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 3,
//               child: CustomTextformfield(
//                 controller: cantidadController,
//                 label: 'Cantidad contada',
//                 hintText: 'Ingrese la cantidad',
//                 prefixIcon: const Icon(Icons.numbers),
//                 validator: ValidatorsInputs.validatePositiveNumber,
//                 readOnly: !puedeEditar,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
//                 ],
//                 onChanged: (value) {
//                   final cantidad = double.tryParse(value) ?? 0;

//                   final productoActualizado = detalleConteo.copyWith(
//                       cantidadConteo: cantidad, fechaConteo: DateTime.now());

//                   ref
//                       .read(detalleConteoAsignadoProvider.notifier)
//                       .actualizarProducto(productoActualizado);
//                 },
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 height: 58,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: colorScheme.primary),
//                 ),
//                 child: Center(
//                   child: Text(
//                     detalleConteo.producto?.listaUnidadMedida
//                             .firstWhere(
//                               (um) =>
//                                   um.codigo == detalleConteo.codigoUnidadMedida,
//                               orElse: () => detalleConteo
//                                   .producto!.listaUnidadMedida.first,
//                             )
//                             .descripcion ??
//                         'Vacio',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8),
//             Flexible(
//               flex: 1,
//               child: SizedBox(
//                 height: 58,
//                 child: InkWell(
//                   onTap: puedeEditar
//                       ? () async {
//                           final unidadMedida = detalleConteo
//                               .producto?.listaUnidadMedida
//                               .firstWhere(
//                             (um) =>
//                                 um.codigo == detalleConteo.codigoUnidadMedida,
//                             orElse: () =>
//                                 detalleConteo.producto!.listaUnidadMedida.first,
//                           );
//                           final cantidadActual = cantidadController.text.isEmpty
//                               ? 0.0
//                               : double.parse(cantidadController.text);
//                           final result = await context
//                               .push('/assigned-count-unit-measure', extra: {
//                             'producto': detalleConteo,
//                             'cantidadActual': cantidadActual,
//                             'unidadMedida': unidadMedida
//                           });

//                           if (result != null &&
//                               result is Map<String, dynamic>) {
//                             final cantidad = result['cantidad'] as double;
//                             final descripcion = result['descripcion'] as String;

//                             cantidadController.text = cantidad.toString();
//                             descripcionNotifier.value = descripcion;
//                           }
//                         }
//                       : null,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: colorScheme.primary),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'MÁS',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
