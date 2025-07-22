import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_count_results_model.freezed.dart';
part 'list_count_results_model.g.dart';

@freezed
class ListCountResultsModel with _$ListCountResultsModel {
  const factory ListCountResultsModel({
    required int codeCountInventory,
    required int codeUser,
    required String nameUser,
    required double quantityCount
  }) = _ListCountResultsModel;

  factory ListCountResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ListCountResultsModelFromJson(json);
}
