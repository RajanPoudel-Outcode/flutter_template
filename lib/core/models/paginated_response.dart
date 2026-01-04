import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({required Pagination pagination, required List<T> data}) =
      _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}

@freezed
abstract class Pagination with _$Pagination {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Pagination({
    required int total,
    required num totalPages,
    required int perPage,
    required int page,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
