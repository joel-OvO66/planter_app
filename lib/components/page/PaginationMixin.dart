import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/page/Pagination.dart';
import 'package:tornado/page/PaginationState.dart';
import 'package:tornado/util/DateFormater.dart';

mixin PaginationMixin<E, T extends StatefulWidget> on PaginationState<E, T> {
  // late BrnSelectionEntityListBean selectionEntityListBean;

  List<BrnSelectionEntity>? filters;

  dynamic createDateTimeFilter(String key, String title) {
    return {
      "key": key,
      "type": "radio",
      "title": title,
      "ext": {},
      "value": "all",
      "children": [
        {"key": "unLimit", "type": "radio", "value": "unLimit", "title": "不限"},
        {"key": "1hour", "type": "radio", "value": "1hour", "title": "一小时前"},
        {"key": "1day", "type": "radio", "value": "1day", "title": "一天前"},
        {"key": "1month", "type": "radio", "value": "1month", "title": "一月前"},
        {"key": "1year", "type": "radio", "value": "1year", "title": "一年前"},
        {
          "defaultValue": "",
          "ext": {"min": "1396797343911", "max": DateTime.now().millisecondsSinceEpoch.toString()},
          "children": [],
          "key": "custome",
          "type": "daterange",
          "title": "自定义日期"
        }
      ]
    };
  }

  dynamic createDateFilters(String key, String title) {
    return {
      "key": key,
      "type": "radio",
      "title": title,
      "ext": {},
      "value": "all",
      "children": [
        {"key": "unLimit", "type": "radio", "value": "unLimit", "title": "不限"},
        {"key": "1day", "type": "radio", "value": "1day", "title": "一天前"},
        {"key": "1month", "type": "radio", "value": "1month", "title": "一月前"},
        {"key": "1year", "type": "radio", "value": "1year", "title": "一年前"},
        {
          "defaultValue": "",
          "ext": {"min": "1396797343911", "max": DateTime.now().millisecondsSinceEpoch.toString()},
          "children": [],
          "key": "custome",
          "type": "daterange",
          "title": "自定义日期"
        }
      ]
    };
  }

  dynamic createNumberFilter(String key, String title, String rangeTitle, String unit, {num? min = 0, num? max = 9999999, required List options}) {
    return {
      "title": title,
      "key": key,
      "type": "checkbox",
      "value": "all",
      "children": [
        {"title": "不限", "key": "", "type": "unlimit", "defaultValue": "", "value": "unlimit"},
        ...options,
        {
          "defaultValue": "",
          "ext": {"min": min, "max": max, "unit": unit},
          "children": [],
          "key": "",
          "type": "range",
          "value": "",
          "title": rangeTitle
        }
      ]
    };
  }

  /// 过滤数组
  void filterOperatorIn(String key, String value) {
    List<String> types = value.split(",");
    if (types.isNotEmpty) {
      if (types.length == 1) {
        this.pagination.addFilter(key, value);
      } else {
        this.pagination.addFilter(key, types, operator: Operator.In, override: false);
      }
    } else {
      this.pagination.removeFilter(key);
    }
  }

  void filterDate(String key, String value) {
    DateTime now = DateTime.now();
    switch (value) {
      case "unLimit":
        this.pagination.removeFilter(key);
        break;
      case "1day":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 1))), operator: Operator.dateGe);
        break;
      case "1month":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 30))), operator: Operator.dateGe);
        break;
      case "1year":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 365))), operator: Operator.dateGe);
        break;
      default:
        List dateRange = value.split(":");
        DateTime startDate = DateTime.fromMillisecondsSinceEpoch(int.parse(dateRange[0]));
        DateTime endDate = DateTime.fromMillisecondsSinceEpoch(int.parse(dateRange[1]));
        endDate = endDate.add(Duration(days: 1)).subtract(Duration(seconds: 1));
        this.pagination.addFilter(key, [DateFormater.formatDate(startDate), DateFormater.formatDate(endDate)], operator: Operator.dateBetween);
        break;
    }
  }

  void filterDateTime(String key, String value) {
    DateTime now = DateTime.now();
    switch (value) {
      case "unLimit":
        this.pagination.removeFilter(key);
        break;
      case "1hour":
        this.pagination.addFilter(key, DateFormater.formatDateTime(now.subtract(Duration(hours: 1))), operator: Operator.dateTimeGe);
        break;
      case "1day":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 1))), operator: Operator.dateTimeGe);
        break;
      case "1month":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 30))), operator: Operator.dateTimeGe);
        break;
      case "1year":
        this.pagination.addFilter(key, DateFormater.formatDate(now.subtract(Duration(days: 365))), operator: Operator.dateTimeGe);
        break;
      default:
        List dateRange = value.split(":");
        DateTime startDate = DateTime.fromMillisecondsSinceEpoch(int.parse(dateRange[0]));
        DateTime endDate = DateTime.fromMillisecondsSinceEpoch(int.parse(dateRange[1]));
        endDate = endDate.add(Duration(days: 1)).subtract(Duration(seconds: 1));
        this.pagination.addFilter(key, [DateFormater.formatDateTime(startDate), DateFormater.formatDateTime(endDate)], operator: Operator.dateTimeBetween);
        break;
    }
  }

  void filterNumberRange(String key, String value) {
    switch (value) {
      case "unLimit":
        this.pagination.removeFilter(key);
        break;
      default:
        List range = value.split(":");
        this.pagination.addFilter(key, [range[0], range[1]], operator: Operator.numberBetween);
        break;
    }
  }

  /// 过滤所有
  void filterAll(String key, String value) {
    if (value == 'all') {
      this.pagination.removeFilter(key);
    } else {
      this.pagination.addFilter(key, value);
    }
  }
}
