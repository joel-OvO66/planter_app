import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tornado/form/FormMixin.dart';

import '../../api/FeedbackController.dart';
import '../../components/form/TextAreaInputFormFiled.dart';
import '../../entity/security/entity/Feedback.dart' as my;
import '../../generated/l10n.dart';
import '../../ui/MainButton.dart';
import '../../ui/card/BasicCard.dart';

class FeedbackForm extends StatefulWidget {
  final my.Feedback? feedback;

  const FeedbackForm({super.key, this.feedback});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> with FormMixin<my.Feedback, FeedbackForm> {
  @override
  void initState() {
    super.initState();
    if (widget.feedback != null) {
      entity = my.Feedback.fromJson(jsonDecode(jsonEncode(widget.feedback)));
    } else {
      entity = my.Feedback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).create_farm)),
        body: Form(
            key: formKey, //设置globalKey，用于后面获取FormState
            child: BasicCard(
                child: Column(
              children: [
                TextAreaInputFormFiled(
                    title: S.of(context).farm_remark,
                    maxCharCount: 255,
                    initialValue: entity.content,
                    onSaved: (value) {
                      entity.content = value;
                    }),
              ],
            ))),
        bottomNavigationBar: SafeArea(
            child: MainButton(
                margin: EdgeInsets.only(bottom: 36.sp, left: 32.sp, right: 32.sp),
                onPressed: () {
                  submitForm();
                },
                text: S.of(context).save)));
  }

  @override
  onValidSuccess(my.Feedback formValue) {
    if (widget.feedback != null) {
      FeedbackController.updateFeedback(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      FeedbackController.addFeedback(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        // Navigator.pushAndRemoveUntil(context, AnimationRoute(MainPage()), (route) => route == null);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}
