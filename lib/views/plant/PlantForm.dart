import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/entity/farm/entity/Room.dart';
import 'package:tornado/form/FormItem.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';
import 'package:tornado/network/HttpService.dart';

import '../../api/PlantController.dart';
import '../../api/RoomController.dart';
import '../../components/form/SelectPickerFormField.dart';
import '../../components/form/TextAreaInputFormFiled.dart';
import '../../components/form/TextInputFormField.dart';
import '../../entity/farm/entity/Plant.dart';
import '../../entity/farm/entity/PlantCategory.dart';
import '../../generated/l10n.dart';
import '../../ui/MainButton.dart';

/**
 * PlantForm 主类
 **/
class PlantForm extends StatefulWidget {
  final Plant? plant;

  const PlantForm({Key? key, this.plant}) : super(key: key);

  @override
  _PlantFormState createState() => _PlantFormState();
}

/**
 * PlantForm UI布局
 **/
class _PlantFormState extends State<PlantForm> with FormMixin<Plant, PlantForm> {
  List<PlantCategory> plantCategories = [];
  List<Room> rooms = [];
  @override
  void initState() {
    super.initState();
    if (widget.plant != null) {
      entity = Plant.fromJson(jsonDecode(jsonEncode(widget.plant)));
    } else {
      entity = Plant();
    }
    PlantController.getAllPlantCategories().ifNotNull((value) {
      setState(() {
        plantCategories = value;
      });
    });
    RoomController.getAllRooms().ifNotNull((value) {
      setState(() {
        rooms = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).plant)),
        body: SingleChildScrollView(
            child: Form(
                key: formKey, //设置globalKey，用于后面获取FormState
                child: Column(children: [
                  TextInputFormField(
                      title: S.of(context).plant_plantName,
                      isRequire: true,
                      placeholder: S.of(context).input,
                      maxCharCount: 32,
                      initialValue: entity.plantName,
                      validators: [Validator.required(context)],
                      onSaved: (value) {
                        entity.plantName = value;
                      }),
                  // TextInputFormField(
                  //     title: S.of(context).plant_plantCategory,
                  //     isRequire: false,
                  //     placeholder: S.of(context).input,
                  //     maxCharCount: 32,
                  //     initialValue: entity.plantCategory,
                  //     //validators: [Validator.required(context)],
                  //     onSaved: (value) {
                  //       entity.plantCategory = value;
                  //     }),
                  // SelectPickerFormField<PlantCategory>(
                  //     title: S.of(context).plant_plantCategory,
                  //     isRequire: false,
                  //     initialValue: entity.plantCategory,
                  //     formItems: plantCategories.map((e) => FormItem(e.categoryName!, e)).toList(),
                  //     confirmText: S.of(context).confirm,
                  //     cancelText: S.of(context).cancel,
                  //     notContentText: S.of(context).tip_not_content_tip,
                  //     onSaved: (value) {
                  //       entity.plantCategory = value;
                  //     }),
                  SelectPickerFormField<Room>(
                      title: S.of(context).plant_room,
                      isRequire: true,
                      initialValue: entity.room,
                      formItems: rooms.map((e) => FormItem(e.roomName!, e)).toList(),
                      confirmText: S.of(context).confirm,
                      cancelText: S.of(context).cancel,
                      notContentText: S.of(context).tip_not_content_tip,
                      onSaved: (value) {
                        entity.room = value;
                      },
                      validators: [Validator.required(context)]),
                  TextAreaInputFormFiled(
                      title: S.of(context).plant_remark,
                      maxCharCount: 255,
                      placeholder: S.of(context).farm_description_input_tip,
                      initialValue: entity.remark,
                      onSaved: (value) {
                        this.entity.remark = value;
                      }),
                ]))),
        bottomNavigationBar: MainButton(
          onPressed: () {
            submitForm();
          },
          text: S.of(context).save,
        ));
  }

  @override
  onValidSuccess(Plant formValue) {
    if (widget.plant != null) {
      PlantController.updatePlant(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => this.submitted = false);
    } else {
      PlantController.addPlant(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => this.submitted = false);
    }
  }
}
