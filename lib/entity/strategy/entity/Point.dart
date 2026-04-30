import 'package:json_annotation/json_annotation.dart';

part 'Point.g.dart';

@JsonSerializable()
class Point {
  int time;
  int value;
  Point({
    this.time = 0,
    this.value = 0,
  }) {}

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}
