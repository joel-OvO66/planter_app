import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/api/FarmController.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:provider/provider.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';

import '../../common/FarmService.dart';
import '../../components/form/TextAreaInputFormFiled.dart';
import '../../components/form/TextInputFormField.dart';
import '../../entity/farm/entity/Farm.dart';
import '../../generated/l10n.dart';
import '../../ui/MainButton.dart';
import '../../ui/card/BasicCard.dart';

/// FarmForm 主类
class FarmForm extends StatefulWidget {
  final Farm? farm;

  final bool bCreate;

  const FarmForm({Key? key, this.farm, required this.bCreate}) : super(key: key);

  @override
  _FarmFormState createState() => _FarmFormState();
}

/// FarmForm UI布局
class _FarmFormState extends State<FarmForm> with FormMixin<Farm, FarmForm> {
  List<String> options = [];
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.farm != null) {
      entity = Farm.fromJson(jsonDecode(jsonEncode(widget.farm)));
    } else {
      entity = Farm();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: widget.bCreate? Text(S.of(context).create_farm) : Text(entity.tenantName!)),
        body: Form(
            key: formKey, //设置globalKey，用于后面获取FormState
            child: Container(
              margin: EdgeInsets.only(left:20.sp, right: 20.sp, top: 20.sp),
              child: Column(
                children: [
              TextInputFormField(
                  title: S.of(context).farm_farmName,
                  isRequire: true,
                  placeholder: '${S.of(context).farm_farmName_input_tip}',
                  maxCharCount: 32,
                  initialValue: entity.tenantName,
                  validators: [Validator.required(context)],
                  onSaved: (value) {
                    entity.tenantName = value;
                  }),
              // TextInputFormField(
              //     title: S.of(context).farm_address,
              //     isRequire: true,
              //     placeholder: '${S.of(context).input}${S.of(context).farm_address}',
              //     maxCharCount: 64,
              //     end: GestureDetector(
              //       onTap: () {
              //         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleMapPage()));
              //         // EasyLoading.show(status: "正在定位");
              //         // LocationUtil.getLocation().then((value) {
              //         //   LocationData? location = value;
              //         //   entity.latLng = LatLng(lat: location!.latitude!, lng: location.longitude!);
              //         //   TianHeController().getCityName(location.latitude!, location.longitude!).then((value) {
              //         //     dynamic obj = value['location'];
              //         //     addressController.text = "${obj[0]['country']} ${obj[0]['adm1']} ${obj[0]['adm2']}";
              //         //     entity.address = addressController.text;
              //         //     setState(() {});
              //         //   }).whenComplete(() => EasyLoading.dismiss());
              //         // });
              //       },
              //       child: Container(
              //         height: 72.sp,
              //         color: Colors.white, // Set the background color to white
              //         padding: EdgeInsets.only(right: 10.sp),
              //         child: Assets.images.farmSetting.mapLine.image(width: 36.sp),
              //       ),
              //     ),
              //     initialValue: entity.address,
              //     controller: addressController,
              //     validators: [Validator.required()],
              //     onSaved: (value) {
              //       entity.address = value;
              //     }),
              // BrnTextQuickSelectFormItem(
              //   prefixIconType: BrnPrefixIconType.add,
              //   isRequire: true,
              //   btnsTxt: options,
              //   selectBtnList: statusAllFunctionDemo,
              //   value: plantValue,
              //   isBtnsScroll: true,
              //   error: plantValue != '' ? '' : "必填项不能为空",
              //   title: "Classification",
              //   hint: "Select Classification",
              //   onBtnSelectChanged: (index) {
              //     statusAllFunctionDemo[index] = !statusAllFunctionDemo[index];
              //     if (statusAllFunctionDemo[index]) {
              //       plantValue += '${options[index]},';
              //     } else if (plantValue.contains(options[index])) {
              //       plantValue = plantValue.replaceFirst('${options[index]},', '');
              //     }
              //     setState(() {});
              //   },
              //   onAddTap: () {
              //     BrnMiddleInputDialog(
              //         title: 'New Classification Name',
              //         message: "",
              //         hintText: 'Enter Classification Name',
              //         cancelText: 'Cancel',
              //         confirmText: 'Confirm',
              //         autoFocus: true,
              //         maxLength: 1000,
              //         maxLines: 2,
              //         dismissOnActionsTap: false,
              //         barrierDismissible: true,
              //         onConfirm: (value) {
              //           if (value != '') {
              //             setState(() {
              //               options.add(value);
              //               statusAllFunctionDemo.add(false);
              //               Navigator.pop(context);
              //             });
              //           } else {
              //             BrnToast.show('Please Enter Classification Name', context);
              //           }
              //         },
              //         onCancel: () {
              //           Navigator.pop(context);
              //         }).show(context);
              //   },
              // ),
              TextAreaInputFormFiled(
                  title: S.of(context).farm_remark,
                  maxCharCount: 255,
                  placeholder: S.of(context).farm_description_input_tip,
                  initialValue: entity.remark,
                  onSaved: (value) {
                    entity.remark = value;
                  }),
            ],
              )
            )
        ),
        bottomNavigationBar:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MainButton(
                margin: EdgeInsets.only(bottom: 36.sp, left: 32.sp, right: 32.sp, top: 45.sp),
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
                    FarmController.deleteFarmById(entity.tenantId).then((value) {
                      Fluttertoast.showToast(msg: S.of(context).removeSuccess);
                      context.read<FarmService>().removeFarm(entity.tenantId);
                      context.read<FarmService>().reloadFarms();
                      Navigator.of(context).pop();
                    }).onError((error, stackTrace) => null);
                  });
                },
                text: S.of(context).remove
              ),
            ),
          ],
        ),

    );
  }

  @override
  onValidSuccess(Farm formValue) {
    if (addressController.text != null) {
      formValue.address = addressController.text;
    }
    // formValue.plants = formPlants;
    if (widget.farm != null) {
      FarmController.updateFarm(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        context.read<FarmService>().reloadFarms();
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      FarmController.addFarm(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        context.read<FarmService>().reloadFarms();
        // Navigator.pushAndRemoveUntil(context, AnimationRoute(MainPage()), (route) => route == null);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}
