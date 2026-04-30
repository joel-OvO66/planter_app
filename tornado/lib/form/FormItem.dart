import 'package:json_annotation/json_annotation.dart';

part 'FormItem.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class FormItem<T> {
  late String label;
  late T value;

  FormItem(this.label, this.value) {}

  String toString() {
    return label;
  }

  factory FormItem.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJson) => _$FormItemFromJson(json, fromJson);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$FormItemToJson(this, toJsonT);
}
