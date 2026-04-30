import 'dart:async';
import 'dart:convert';

import 'package:esp_blufi/esp_blufi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:planter_app/style/AppTheme.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:planter_app/ui/list/ListTileItem.dart';
import 'package:planter_app/views/dashboard/device/DeviceScanPage.dart';
import 'package:tornado/form/FormItem.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';

import '../../../Constants.dart';
import '../../../api/RoomController.dart';
import '../../../components/form/TextAreaInputFormFiled.dart';
import '../../../components/form/TextInputFormField.dart';
import '../../../entity/farm/entity/Room.dart';
import '../../../generated/l10n.dart';
import '../../../ui/MainButton.dart';
import '../../setting/BlueScanButton.dart';
import 'WifiScanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/**
 * RoomEditForm 主类
 **/
class RoomEditForm extends StatefulWidget {
  final Room? room;
  final bool bCreate;

  const RoomEditForm({Key? key, this.room, this.bCreate = false}) : super(key: key);

  @override
  _RoomEditFormState createState() => _RoomEditFormState();
}

/**
 * RoomEditForm UI布局
 **/
class _RoomEditFormState extends State<RoomEditForm> with FormMixin<Room, RoomEditForm>, WifiScanner {
  List<FormItem> formItems = [];

  // 定义一个GlobalKey来访问FormField的状态
  final GlobalKey<FormFieldState<String>> _fieldKey = GlobalKey<FormFieldState<String>>();

  TextEditingController controller = TextEditingController();
  WidgetStatesController scanController = WidgetStatesController();

  bool isInit = false;

  @override
  void initState() {
    super.initState();
    if (widget.room != null) {
      entity = Room.fromJson(jsonDecode(jsonEncode(widget.room)));
    } else {
      entity = Room();
    }
    controller.text = entity.deviceId ?? "";
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // BrnInitializer.register(allThemeConfig: BrunoThemeConfig.lightBrnTheme());
    return Scaffold(
        appBar: AppBar(title: Text("${widget.bCreate == false ? S.of(context).edit : S.of(context).create} ${S.of(context).room}")),
        body: Form(
            key: formKey, //设置globalKey，用于后面获取FormState
            child: Column(
              children: [
                TextInputFormField(
                    title: "${S.of(context).room_roomName}",
                    isRequire: true,
                    placeholder: '${S.of(context).input}${S.of(context).room_roomName}',
                    maxCharCount: 32,
                    initialValue: entity.roomName,
                    validators: [Validator.required(context)],
                    onSaved: (value) {
                      entity.roomName = value;
                    }),
                TextInputFormField(
                    key: _fieldKey,
                    title: "${S.of(context).sensorRecord_deviceId}",
                    isRequire: true,
                    isEdit: widget.bCreate,
                    placeholder: '${S.of(context).input}${S.of(context).sensorRecord_deviceId}',
                    maxCharCount: 32,
                    controller: controller,
                    initialValue: entity.deviceId,
                    validators: [Validator.required(context)],
                    onChanged: (value) {
                      entity.deviceId = value;
                    },
                    onSaved: (value) {
                      entity.deviceId = value;
                    }),
                TextAreaInputFormFiled(
                    title: S.of(context).room_remark,
                    maxCharCount: 255,
                    placeholder: S.of(context).farm_description_input_tip,
                    initialValue: entity.remark,
                    onSaved: (value) {
                      entity.remark = value;
                    }),
              ],
            )),
        bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: widget.bCreate,
          child: MainButton(
            margin: EdgeInsets.only(bottom: 36.sp, left: 32.sp, right: 32.sp),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceScanPage(isAddDevice: true,))).then((onValue){
                if (onValue != null) {
                  entity.deviceId = onValue;
                  controller.setText(onValue);
                  // 手动触发didChange方法
                  _fieldKey.currentState?.didChange(controller.text);
                }
              });
            },
            text: "Start Search",
          ),
        ),

        MainButton(
            margin: EdgeInsets.only(bottom: 36.sp, left: 32.sp, right: 32.sp),
            onPressed: () {
              submitForm();
            },
            text: S.of(context).save
        ),

        Visibility(
          visible: widget.bCreate ? false : true,
          child: MainButton(
              margin: EdgeInsets.only(bottom: 36.sp, left: 32.sp, right: 32.sp),
              color: Colors.red,
              onPressed: () {
                DialogAlert.removeConfirm(context, () {
                  RoomController.removeRoomById(entity.roomId).then((value) {
                    Fluttertoast.showToast(msg: S.of(context).removeSuccess);
                    setState(() {
                    });
                  }).onError((error, stackTrace) => null);
                });
              },
              text: S.of(context).remove
          ),
        ),
      ],
    );
  }

  @override
  onValidSuccess(Room formValue) {
    if (widget.room != null) {
      RoomController.updateRoom(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      RoomController.addRoom(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}
