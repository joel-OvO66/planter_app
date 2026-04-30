// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination<T> _$PaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Pagination<T>(
      json['pageUrl'] as String,
    )
      ..filterFields = (json['filterFields'] as List<dynamic>)
          .map((e) => FilterField.fromJson(e as Map<String, dynamic>))
          .toList()
      ..defaultSort = json['defaultSort'] as String?
      ..defaultOrder = json['defaultOrder'] as String?
      ..pageIndex = (json['pageIndex'] as num).toInt()
      ..content = (json['content'] as List<dynamic>).map(fromJsonT).toList();

Map<String, dynamic> _$PaginationToJson<T>(
  Pagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'pageUrl': instance.pageUrl,
      'filterFields': instance.filterFields,
      'defaultSort': instance.defaultSort,
      'defaultOrder': instance.defaultOrder,
      'pageIndex': instance.pageIndex,
      'content': instance.content.map(toJsonT).toList(),
    };

_PageRequest _$PageRequestFromJson(Map<String, dynamic> json) => _PageRequest()
  ..offset = (json['offset'] as num).toInt()
  ..limit = (json['limit'] as num).toInt()
  ..data = json['data'] as Map<String, dynamic>?
  ..sort = json['sort'] as String?
  ..filters = (json['filters'] as List<dynamic>)
      .map((e) => _Filter.fromJson(e as Map<String, dynamic>))
      .toList()
  ..orFilters = (json['orFilters'] as List<dynamic>)
      .map((e) => _Filter.fromJson(e as Map<String, dynamic>))
      .toList()
  ..order = json['order'] as String?;

Map<String, dynamic> _$PageRequestToJson(_PageRequest instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'data': instance.data,
      'sort': instance.sort,
      'filters': instance.filters,
      'orFilters': instance.orFilters,
      'order': instance.order,
    };

PageResponse<T> _$PageResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageResponse<T>()
      ..content = (json['content'] as List<dynamic>).map(fromJsonT).toList()
      ..first = json['first'] as bool
      ..last = json['last'] as bool
      ..number = (json['number'] as num).toInt()
      ..numberOfElements = (json['numberOfElements'] as num).toInt()
      ..size = (json['size'] as num).toInt()
      ..sort = json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>)
      ..totalElements = (json['totalElements'] as num).toInt()
      ..totalPages = (json['totalPages'] as num).toInt();

Map<String, dynamic> _$PageResponseToJson<T>(
  PageResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'content': instance.content.map(toJsonT).toList(),
      'first': instance.first,
      'last': instance.last,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'sort': instance.sort,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_Filter _$FilterFromJson(Map<String, dynamic> json) => _Filter(
      json['field'] as String,
      json['value'],
      $enumDecode(_$OperatorEnumMap, json['operator']),
      ignoreCase: json['ignoreCase'] as bool? ?? true,
    );

Map<String, dynamic> _$FilterToJson(_Filter instance) => <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'operator': _$OperatorEnumMap[instance.operator]!,
      'ignoreCase': instance.ignoreCase,
    };

const _$OperatorEnumMap = {
  Operator.eq: 'eq',
  Operator.dateEq: 'dateEq',
  Operator.dateLe: 'dateLe',
  Operator.dateGe: 'dateGe',
  Operator.dateTimeLe: 'dateTimeLe',
  Operator.dateTimeGe: 'dateTimeGe',
  Operator.dateBetween: 'dateBetween',
  Operator.dateTimeBetween: 'dateTimeBetween',
  Operator.numberBetween: 'numberBetween',
  Operator.ne: 'ne',
  Operator.gt: 'gt',
  Operator.lt: 'lt',
  Operator.ge: 'ge',
  Operator.le: 'le',
  Operator.startLike: 'startLike',
  Operator.endLike: 'endLike',
  Operator.like: 'like',
  Operator.In: 'In',
  Operator.notIn: 'notIn',
  Operator.isNull: 'isNull',
  Operator.isNotNull: 'isNotNull',
};

Sort _$SortFromJson(Map<String, dynamic> json) => Sort()
  ..sorted = json['sorted'] as bool?
  ..unsorted = json['unsorted'] as bool?
  ..empty = json['empty'] as bool?;

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
      'empty': instance.empty,
    };
