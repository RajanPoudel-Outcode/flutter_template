// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedResponse<T>(
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  _PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'pagination': instance.pagination,
  'data': instance.data.map(toJsonT).toList(),
};

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  total: (json['total'] as num).toInt(),
  totalPages: json['total_pages'] as num,
  perPage: (json['per_page'] as num).toInt(),
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'total_pages': instance.totalPages,
      'per_page': instance.perPage,
      'page': instance.page,
    };
