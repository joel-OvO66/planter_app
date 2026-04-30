import 'package:json_annotation/json_annotation.dart';

part 'Comment.g.dart';

@JsonSerializable()
class Comment   {
  Comment() {}

  String? id;

  String? message;

  String? type;

  String? taskId;

  String? processInstanceId;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

}
