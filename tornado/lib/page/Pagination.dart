import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import 'FilterField.dart';
import '../network/HttpService.dart';

part 'Pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Pagination<T> {
  /**
   * 分页查询请求url
   */
  String pageUrl;

  /**
   * 过滤字段
   */
  List<FilterField> filterFields = [];

  /**
   * 分页请求对象
   */
  _PageRequest? _pageRequest;

  /**
   * 分页返回数据对象
   */
  PageResponse<T> _pageResponse = PageResponse();

  /**
   * 默认条件，不可清除
   */
  List<_Filter> _defaultFilters = [];

  /**
   * 默认or条件
   */
  List<_Filter> _defaultOrFilters = [];

  /**
   * 默认排序字段
   */
  String? defaultSort = '';

  /**
   * 默认排序方式
   */
  String? defaultOrder = '';

  Pagination(this.pageUrl) {
    this._pageRequest = new _PageRequest();
  }

  Future<Response> refresh() {
    return HttpService.instance.dio.post(pageUrl, data: json.encode(this._pageRequest));
  }

  void covertResponse(PageResponse data) {
    this._pageResponse.first = data.first;
    this._pageResponse.last = data.last;
    this._pageResponse.number = data.number;
    this._pageResponse.numberOfElements = data.numberOfElements;
    this._pageResponse.size = data.size;
    this._pageResponse.sort = data.sort;
    this._pageResponse.totalElements = data.totalElements;
    this._pageResponse.totalPages = data.totalPages;
  }

  /**
   * 重新从第一页加载
   */
  Future<Response> reload() {
    appendDeclareFilters();
    return toPage(1);
  }

  /**
   * 跳转到指定页
   */
  Future<Response> toPage(int pageIndex) {
    this.pageIndex = pageIndex;
    return refresh();
  }

  /**
   * 重置查询
   */
  Future<Response> reset() {
    clearFilters();
    clearOrFilters();
    clearFilterFields();
    _pageRequest!.filters.addAll(_defaultFilters);
    _pageRequest!.orFilters.addAll(_defaultOrFilters);
    return this.reload();
  }

  void appendDeclareFilters() {
    if (this.filterFields.isNotEmpty) {
      // 先清除所有声明式的条件
      this.filterFields.forEach((element) {
        if (element.logicAnd) {
          removeFilter(element.field);
        } else {
          removeOrFilter(element.field);
        }
      });
      //加入新的条件
      for (FilterField element in this.filterFields) {
        dynamic value = element.value;
        if (value != null) {
          if (value is String) {
            value = value.trim();
            if (value.isEmpty) {
              continue;
            }
          } else if (value is num) {
            if (value == 0) {
              continue;
            }
          } else if (value is List) {
            if (value.isEmpty) {
              continue;
            } else if (value[0] == '' || value[1] == '') {
              continue;
            }
          }
          if (element.logicAnd) {
            this.addFilter(element.field, value, operator: element.operator, override: element.override);
          } else {
            this.addOrFilter(element.field, value, operator: element.operator, override: element.override);
          }
        }
      }
    }
  }

  /**
   * 添加默认的过滤条件，条件不可清除
   */
  void addDefaultFilter(String field, dynamic value, {Operator operator = Operator.eq, bool override = true}) {
    _Filter filter = _Filter(field, value, operator);
    if (override) {
      Iterable<_Filter> iterable = _defaultFilters.where((element) => element.field == field);
      if (iterable.isEmpty) {
        _defaultFilters.add(filter);
      } else {
        iterable.forEach((element) {
          element.operator = operator;
          element.value = value;
        });
      }
    } else {
      _defaultFilters.add(filter);
    }
    this._pageRequest!.filters.add(filter);
  }

  void addDefaultOrFilter(String field, dynamic value, {Operator operator = Operator.eq, bool override = true}) {
    _Filter filter = _Filter(field, value, operator);
    if (override) {
      Iterable<_Filter> iterable = _defaultOrFilters.where((element) => element.field == field);
      if (iterable.isEmpty) {
        _defaultOrFilters.add(filter);
      } else {
        iterable.forEach((element) {
          element.operator = operator;
          element.value = value;
        });
      }
    } else {
      _defaultOrFilters.add(filter);
    }
    this._pageRequest!.orFilters.add(filter);
  }

  void addFilter(String filed, dynamic value, {Operator operator = Operator.eq, bool override = true}) {
    _Filter filter = _Filter(filed, value, operator);
    if (override) {
      Iterable<_Filter> iterable = this._pageRequest!.filters.where((element) => element.field == filed);
      if (iterable.isEmpty) {
        this._pageRequest!.filters.add(filter);
      } else {
        iterable.forEach((element) {
          element.operator = operator;
          element.value = value;
        });
      }
    } else {
      this._pageRequest!.filters.add(filter);
    }
  }

  void addOrFilter(String filed, dynamic value, {Operator operator = Operator.eq, bool override = true}) {
    _Filter filter = _Filter(filed, value, operator);
    if (override) {
      Iterable<_Filter> iterable = this._pageRequest!.orFilters.where((element) => element.field == filed);
      if (iterable.isEmpty) {
        this._pageRequest!.orFilters.add(filter);
      } else {
        iterable.forEach((element) {
          element.operator = operator;
          element.value = value;
        });
      }
    } else {
      this._pageRequest!.orFilters.add(filter);
    }
  }

  dynamic getFilterValue(String field) {
    return _pageRequest!.filters.firstWhere((element) => element.field == field, orElse: () => _Filter('', null, Operator.eq)).value;
  }

  void removeFilter(String field) {
    _pageRequest!.filters.removeWhere((element) => element.field == field);
  }

  void removeOrFilter(String field) {
    _pageRequest!.orFilters.removeWhere((element) => element.field == field);
  }

  void removeDefaultFilter(String field) {
    _defaultFilters.removeWhere((element) => element.field == field);
  }

  void removeDefaultOrFilter(String field) {
    _defaultOrFilters.removeWhere((element) => element.field == field);
  }

  void clearFilters() {
    _pageRequest!.filters.clear();
  }

  void clearOrFilters() {
    _pageRequest!.orFilters.clear();
  }

  void clearFilterFields() {
    filterFields.forEach((element) {
      element.value = null;
      element.hint = null;
    });
  }

  void clearDefaultFilters() {
    _defaultFilters.clear();
  }

  void clearDefaultOrFilters() {
    _defaultOrFilters.clear();
  }

  void putData(key, value) {
    if (this._pageRequest!.data == null) {
      this._pageRequest!.data = {};
    }
    this._pageRequest!.data![key] = value;
  }

  getData(key) {
    return this._pageRequest!.data![key];
  }

  void removeData(filedName) {
    if (this._pageRequest!.data != null) {
      for (var key in this._pageRequest!.data!.keys) {
        if (key == filedName) {
          this._pageRequest!.data!.remove(key);
          break;
        }
      }
    }
  }

  /**
   * 设置默认排序
   * @ param sortName
   * @ param order
   */
  setDefaultSort(sortName, String? order) {
    this.defaultSort = sortName;
    this.defaultOrder = order;
    this._pageRequest!.sort = this.defaultSort;
    this._pageRequest!.order = this.defaultOrder;
  }

  /**
   * 设置排序
   * @ param sortName
   * @ param order
   */
  setSort(String sortName, {String? order = 'asc'}) {
    if (order == null) {
      this.clearSort();
      if (this.defaultOrder != null) {
        this._pageRequest!.sort = this.defaultSort;
        this._pageRequest!.order = this.defaultOrder;
      }
    } else {
      this._pageRequest!.sort = sortName;
      if (order == 'ascend') {
        order = 'asc';
      } else if (order == 'descend') {
        order = 'desc';
      }
      this._pageRequest!.order = order;
    }
    return this.refresh();
  }

  clearSort() {
    this._pageRequest!.sort = null;
    this._pageRequest!.order = null;
  }

  int get totalElements {
    return this._pageResponse.totalElements;
  }

  int get totalPages {
    return this._pageResponse.totalPages;
  }

  void set pageIndex(int pageIndex) {
    this._pageRequest!.offset = (pageIndex - 1) * this._pageRequest!.limit;
  }

  int get pageIndex {
    return this._pageResponse.number + 1;
  }

  List<T> get content {
    return this._pageResponse.content;
  }

  void set content(List<T>? content) {
    if (content != null) {
      this._pageResponse.content = content!;
    }
  }

  bool isLast() {
    return this._pageResponse.last;
  }

  nextPage() {
    this._pageRequest!.offset += this._pageRequest!.limit;
  }

  factory Pagination.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) => _$PaginationFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$PaginationToJson(this, toJsonT);
}

/**
 * 分页请求对象
 */
@JsonSerializable()
class _PageRequest {
  int offset = 0;
  int limit = 20;
  Map<String, dynamic>? data;
  String? sort;
  List<_Filter> filters = [];
  List<_Filter> orFilters = [];
  String? order;

  _PageRequest() {}

  factory _PageRequest.fromJson(Map<String, dynamic> json) => _$PageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PageRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class PageResponse<T> {
  /**
   * 分页返回结果
   */
  List<T> content = [];

  bool first = true;

  bool last = false;

  int number = 0;
  int numberOfElements = 0;
  int size = 10;
  Sort? sort;
  int totalElements = 0;
  int totalPages = 0;

  PageResponse() {}

  factory PageResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJson) => _$PageResponseFromJson(json, fromJson);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$PageResponseToJson(this, toJsonT);
}

@JsonSerializable()
class _Filter {
  String field;
  dynamic value;
  Operator operator;
  bool ignoreCase;

  _Filter(this.field, this.value, this.operator, {this.ignoreCase = true});

  factory _Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class Sort {
  bool? sorted;
  bool? unsorted;
  bool? empty;

  Sort() {}

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}

enum Operator {
  /**
   * 等于
   */
  eq,

  /**
   * 日期等于
   */
  dateEq,
  /**
   * 日期小于等于
   */
  dateLe,
  /**
   * 日期大于等于
   */
  dateGe,
  /**
   * 时间小于等于
   */
  dateTimeLe,
  /**
   * 时间大于等于
   */
  dateTimeGe,
  /**
   * 日期界于
   */
  dateBetween,
  /**
   * 日期带时间界于
   */
  dateTimeBetween,

  ///数字区间界于
  numberBetween,
  /**
   * 不等于
   */
  ne,

  /**
   * 大于
   */
  gt,

  /**
   * 小于
   */
  lt,

  /**
   * 大于等于
   */
  ge,

  /**
   * 小于等于
   */
  le,
  startLike,
  endLike,
  /**
   * 类似
   */
  like,

  /**
   * 包含
   */
  In,

  /**
   * 不包含
   */
  notIn,

  /**
   * 为Null
   */
  isNull,

  /**
   * 不为Null
   */
  isNotNull
}
