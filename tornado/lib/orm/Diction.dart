import 'package:json_annotation/json_annotation.dart';

part 'Diction.g.dart';

@JsonSerializable()
class Diction {
  String label;
  String value;

  Diction(this.label, this.value) {}

  factory Diction.fromJson(Map<String, dynamic> json) => _$DictionFromJson(json);

  Map<String, dynamic> toJson() => _$DictionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Diction && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;


}
