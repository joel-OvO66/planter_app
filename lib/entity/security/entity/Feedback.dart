import 'package:json_annotation/json_annotation.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/orm/AuditingEntity.dart';
import 'package:tornado/orm/AuditingTimeEntity.dart';
import 'package:tornado/orm/Diction.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:planter_app/generated/l10n.dart';
import './User.dart';
// region 前端扩展导入包
// endregion

part 'Feedback.g.dart';
@JsonSerializable()
class Feedback extends AuditingTimeEntity {
   Feedback({
       this.feedId = 0,
       this.content,
       this.user,
       this.reply,
       this.handler,
       this.handleTime,
   }){}
    int feedId;
    String? content;
    User? user;
    String? reply;
    String? handler;
    @JsonKey(toJson: DateFormater.dateTimeNoSecondToJson,fromJson: DateFormater.jsonToDateTimeNoSecond)
    DateTime? handleTime;
   factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);
   Map<String, dynamic> toJson() => _$FeedbackToJson(this);

    // region 前端扩展定义属性及方法区
    // endregion
}

    // region 前端扩展代码区
    // endregion
