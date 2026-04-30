// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormItem<T> _$FormItemFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    FormItem<T>(
      json['label'] as String,
      fromJsonT(json['value']),
    );

Map<String, dynamic> _$FormItemToJson<T>(
  FormItem<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'label': instance.label,
      'value': toJsonT(instance.value),
    };
