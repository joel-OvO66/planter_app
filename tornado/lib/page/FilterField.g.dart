// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FilterField.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterField _$FilterFieldFromJson(Map<String, dynamic> json) => FilterField(
      json['field'] as String,
      json['label'] as String,
      type: $enumDecodeNullable(_$ControlTypeEnumMap, json['type']) ??
          ControlType.TEXT,
      value: json['value'],
      visible: json['visible'] as bool? ?? true,
      logicAnd: json['logicAnd'] as bool? ?? true,
      operator: $enumDecodeNullable(_$OperatorEnumMap, json['operator']) ??
          Operator.like,
      override: json['override'] as bool? ?? true,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$FilterFieldToJson(FilterField instance) =>
    <String, dynamic>{
      'field': instance.field,
      'type': _$ControlTypeEnumMap[instance.type]!,
      'label': instance.label,
      'hint': instance.hint,
      'visible': instance.visible,
      'logicAnd': instance.logicAnd,
      'operator': _$OperatorEnumMap[instance.operator]!,
      'override': instance.override,
      'value': instance.value,
    };

const _$ControlTypeEnumMap = {
  ControlType.TEXT: 'TEXT',
  ControlType.NUMBER: 'NUMBER',
  ControlType.NUMBER_RANGE: 'NUMBER_RANGE',
  ControlType.DATE: 'DATE',
  ControlType.MONTH: 'MONTH',
  ControlType.YEAR: 'YEAR',
  ControlType.TIME: 'TIME',
  ControlType.DATE_RANGE: 'DATE_RANGE',
  ControlType.RADIO: 'RADIO',
  ControlType.SELECT: 'SELECT',
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
