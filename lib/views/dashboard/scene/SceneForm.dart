import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/entity/farm/entity/Room.dart';
import 'package:planter_app/entity/strategy/entity/Scene.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';

import '../../../api/SceneController.dart';
import '../../../components/form/TextAreaInputFormFiled.dart';
import '../../../components/form/TextInputFormField.dart';
import '../../../generated/l10n.dart';
import '../../../ui/MainButton.dart';

/**
 * SceneForm 主类
 **/
class SceneForm extends StatefulWidget {
  final Scene? scene;

  final int roomId;

  const SceneForm({Key? key, this.scene, required this.roomId}) : super(key: key);

  @override
  _SceneFormState createState() => _SceneFormState();
}

/**
 * SceneForm UI布局
 **/
class _SceneFormState extends State<SceneForm> with _SceneFormMixin, FormMixin<Scene, SceneForm> {
  @override
  void initState() {
    super.initState();
    if (widget.scene != null) {
      entity = Scene.fromJson(jsonDecode(jsonEncode(widget.scene)));
    } else {
      entity = Scene();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Grow Plan")),
        body: SingleChildScrollView(
            child: Form(
                key: formKey, //设置globalKey，用于后面获取FormState
                child: Column(children: [
                  TextInputFormField(
                      title: S.of(context).scene_sceneName,
                      isRequire: true,
                      placeholder: 'Enter name',
                      maxCharCount: 32,
                      initialValue: entity.sceneName,
                      validators: [Validator.required(context)],
                      onSaved: (value) {
                        entity.sceneName = value;
                      }),
                  TextAreaInputFormFiled(
                      title: S.of(context).scene_remark,
                      maxCharCount: 255,
                      initialValue: entity.remark,
                      placeholder: S.of(context).farm_description_input_tip,
                      onSaved: (value) {
                        this.entity.remark = value;
                      }),
                ]))),
        bottomNavigationBar: MainButton(
          margin: EdgeInsets.only(bottom: 30.sp, left: 24.sp, right: 24.sp),
          onPressed: () {
            submitForm();
          },
          text: 'Save',
        ));
  }

  @override
  onValidSuccess(Scene formValue) {
    if (widget.scene != null) {
      SceneController.updateScene(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      formValue.room = new Room()..roomId = widget.roomId;
      SceneController.addScene(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}

/**
 * SceneForm 数据逻辑
 **/
mixin _SceneFormMixin<T extends StatefulWidget> on State<T> {}
