import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/page/PaginationState.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../api/FeedbackController.dart';
import '../../entity/security/entity/Feedback.dart' as my;
import '../../generated/l10n.dart';
import '../../ui/EmptyData.dart';
import '../../ui/SlidableItem.dart';
import '../../ui/list/ListTileItem.dart';
import 'FeedbackForm.dart';

/**
* FeedbackPage 主类
**/
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

/**
* FeedbackPage UI布局
**/
class _FeedbackPageState extends PaginationState<my.Feedback, FeedbackPage> with _FeedbackPageMixin {
  _FeedbackPageState() : super(FeedbackController.PAGE_FEEDBACK, (json) => my.Feedback.fromJson(json));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).feedback),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedbackForm())).then((value) {
                    if (value != null) {
                      reload();
                    }
                  });
                })
          ],
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
            child: buildContent(
                emptyContent: EmptyData(
                    content: S.of(context).create,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedbackForm())).then((value) {
                        if (value != null) {
                          reload();
                        }
                      });
                    }),
                itemBuilder: (context, index) {
                  my.Feedback feedback = pagination.content![index];
                  return SlidableItem(
                      showEdit: true,
                      editOnTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedbackForm(feedback: feedback))).then((value) {
                          if (value != null) {
                            reload();
                          }
                        });
                      },
                      deleteOnTap: () {},
                      child: ListTileItem(
                          contentPadding: EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 24.sp),
                          leading: Icon(Icons.feedback_outlined),
                          horizontalTitleGap: 20.sp,
                          title: DateFormater.formatDateTimeNoSecond(feedback.createTime),
                          subtitle: feedback.content,
                          trailing: const Icon(Icons.arrow_forward_ios),
                          crossAxisCount: 2,
                          content: feedback.reply != null ? Text(feedback.reply!) : null,
                          footer: feedback.handleTime != null ? Text(DateFormater.formatDateTimeNoSecond(feedback.handleTime), textAlign: TextAlign.right) : null,
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantDetailPage(plant: plant)));
                          }));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.sp);
                })));
  }
}

/**
* FeedbackPage 数据逻辑
**/
mixin _FeedbackPageMixin<T extends StatefulWidget> on State<T> {}
