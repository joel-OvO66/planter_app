import 'package:json_annotation/json_annotation.dart';

import 'Pagination.dart';
import '../form/FormItem.dart';

part 'FilterField.g.dart';

@JsonSerializable()
class FilterField {
  /**
   * 服务器过滤字段名，支持.
   */
  String field;

  ControlType type;

  String label;

  String? hint;

  bool visible;

  /**
   * 条件逻辑,是否为与
   */
  bool logicAnd;

  Operator operator;

  bool override;

  /**
   * 控件值
   */
  dynamic value;

  FilterField(this.field, this.label,
      {this.type = ControlType.TEXT, this.value, this.visible = true, this.logicAnd = true, this.operator = Operator.like, this.override = true, this.hint});

  factory FilterField.fromJson(Map<String, dynamic> json) => _$FilterFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FilterFieldToJson(this);

}

class TextFilterField extends FilterField{

  @override
  String get label => '请输入' + super.label;

  TextFilterField(String field, String label) : super(field, label);
}

class NumberFilterField extends FilterField{

  NumberFilterField(String field, String label) : super(field, label);

}

class NumberRangeFilterField extends FilterField{

  NumberRangeFilterField(String field, String label) : super(field, label);

}

class RadioRangeFilterField<T> extends FilterField{

  List<FormItem<T>>? items;

  RadioRangeFilterField(String field, String label, this.items) : super(field, label);

}

class SelectRangeFilterField<T> extends FilterField {

  List<FormItem<T>>? items;

  SelectRangeFilterField(String field, String label, this.items) : super(field, label, operator: Operator.eq);

}

class DateFilterField extends FilterField{
  DateFilterField(String field, String label) : super(field, label);

}

class DateRangeFilterField extends FilterField{
  DateRangeFilterField(String field, String label) : super(field, label, value: ['', ''], operator: Operator.dateBetween);

}

enum ControlType { TEXT, NUMBER, NUMBER_RANGE, DATE, MONTH, YEAR, TIME, DATE_RANGE, RADIO, SELECT }
