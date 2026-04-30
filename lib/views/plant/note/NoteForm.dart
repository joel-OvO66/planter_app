import 'dart:convert';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/entity/farm/entity/Note.dart';
import 'package:planter_app/entity/farm/entity/Plant.dart';
import 'package:tornado/form/FormItemContainer.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';

import '../../../api/NoteController.dart';
import '../../../components/PhotoGalleryWidget.dart';
import '../../../components/form/DateTimePickerFormField.dart';
import '../../../components/form/RangeSliderFormField.dart';
import '../../../components/form/SliderFormField.dart';
import '../../../components/form/StepInputFormField.dart';
import '../../../components/form/TextAreaInputFormFiled.dart';
import '../../../components/form/TextInputFormField.dart';
import '../../../generated/l10n.dart';
import '../../../ui/MainButton.dart';

/**
 * NoteForm 主类
 **/
class NoteForm extends StatefulWidget {
  final Plant plant;

  final Note? note;

  final NoteType? noteType;

  const NoteForm({Key? key, required this.plant, this.note, this.noteType}) : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();
}

/**
 * NoteForm UI布局
 **/
class _NoteFormState extends State<NoteForm> with _NoteFormMixin, FormMixin<Note, NoteForm> {
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      entity = Note.fromJson(jsonDecode(jsonEncode(widget.note)));
      if (entity.attachments == null) {
        entity.attachments = [];
      }
    } else {
      entity = Note()
        ..noteTime = DateTime.now()
        ..noteType = widget.noteType
        ..attachments = [];
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).note)),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextInputFormField(
                  title: S.of(context).plant,
                  initialValue: widget.plant.plantName,
                ),
                DateTimePickerFormField(
                    title: S.of(context).note_noteTime,
                    isRequire: true,
                    placeholder: '${S.of(context).input}${S.of(context).note_noteTime}',
                    initialValue: entity.noteTime,
                    validators: [Validator.required(context)],
                    mode: BrnDateTimePickerMode.datetime,
                    onSaved: (value) {
                      entity.noteTime = value;
                    }),
                ..._buildNoteTypeFields(),
                TextAreaInputFormFiled(
                    title: S.of(context).note_noteContent,
                    maxCharCount: 255,
                    placeholder: '${S.of(context).input}${S.of(context).note_noteContent}',
                    initialValue: entity.noteContent,
                    onSaved: (value) {
                      entity.noteContent = value;
                    }),
                FormItemContainer(
                    label: S.of(context).scene_photo,
                    control: Container(
                        margin: EdgeInsets.only(left: 16.sp),
                        child: PhotoGalleryWidget(
                            entity.attachments, enableUpload: true,
                            max: 15,
                            uploadUrl: "upload/uploadImage",
                            uploadDirectory: "/notes/" + widget.plant.plantId.toString(),
                            hintText: S.of(context).upload,
                            snapText: S.of(context).snap,
                            photoText: S.of(context).photo,
                            cancelText: S.of(context).cancel,
                            filming: S.of(context).filming,
                        )
                    )
                )
              ],
            )),
        bottomNavigationBar: MainButton(
          margin: EdgeInsets.only(bottom: 30.sp, left: 24.sp, right: 24.sp),
          onPressed: () {
            submitForm();
          },
          text: S.of(context).save,
        ));
  }

  List<Widget> _buildNoteTypeFields() {
    List<Widget> fields = [];
    switch (entity.noteType!) {
      case NoteType.WATERING:
        fields.add(TextInputFormField(
            title: S.of(context).note_waterVolume,
            inputType: BrnInputType.number,
            isRequire: true,
            placeholder: '${S.of(context).input}',
            initialValue: entity.waterVolume.toString(),
            onSaved: (value) {
              entity.waterVolume = double.parse(value);
            }));
        break;
      case NoteType.HEIGHT:
        fields.add(TextInputFormField(
            title: S.of(context).note_height,
            inputType: BrnInputType.number,
            isRequire: true,
            placeholder: '${S.of(context).input}',
            initialValue: entity.height.toString(),
            onSaved: (String? value) {
              if (value != null) {
                entity.height = double.tryParse(value) ?? 0;
              }
            }));
        break;
      case NoteType.CO2:
        fields.add(StepInputFormField(
            title: S.of(context).note_co2Level,
            isRequire: true,
            initialValue: entity.co2Level,
            onSaved: (value) {
              if (value != null) {
                entity.co2Level = value;
              }
            }));
        break;
      case NoteType.LAMP_TO_PLANT_DISTANCE:
        fields.add(TextInputFormField(
            title: S.of(context).note_distance,
            isRequire: true,
            placeholder: '${S.of(context).input}',
            inputType: BrnInputType.number,
            initialValue: entity.distance.toString(),
            onSaved: (value) {
              if(value != null) {
                entity.distance = double.tryParse(value)?? 0;
              }
            }));
        break;
      case NoteType.POT_SIZE:
        fields.add(TextInputFormField(
            title: S.of(context).note_potSize,
            inputType: BrnInputType.number,
            isRequire: true,
            placeholder: '${S.of(context).input}',
            initialValue: entity.potSize.toString(),
            onSaved: (value) {
              if (value != null) {
                entity.potSize = value;
              }
            }));
        break;
      case NoteType.ROOT_PH:
        fields.add(TextInputFormField(
            title: S.of(context).note_ph,
            inputType: BrnInputType.number,
            isRequire: true,
            placeholder: '${S.of(context).input}',
            initialValue: entity.ph.toString(),
            onSaved: (value) {
              if (value != null) {
                entity.ph = double.tryParse(value) ?? 0;
              }
            }));
        break;
      case NoteType.LIGHT_SCHEDULE:
        fields.add(SliderFormField(
            title: S.of(context).note_lightSchedule,
            isRequire: true,
            min: 0,
            max: 24,
            initialValue: entity.lightSchedule.toDouble(),
            onSaved: (double? value) {
              if (value != null){
                entity.lightSchedule = value.toInt();
              }
            })
        );
        break;
      case NoteType.TEMPERATURE_HUMIDITY:
        fields.add(RangeSliderFormField(
          title: S.of(context).temperature,
          isRequire: true,
          initialValue: RangeValues(entity.minTemp, entity.maxTemp),
        ));
        fields.add(RangeSliderFormField(
          title: S.of(context).humidity,
          isRequire: true, initialValue: RangeValues(entity.minHumi.toDouble(), entity.maxHumi.toDouble()),
          // initialValue: entity.minHumi,
        ));
        break;
      case NoteType.NUTRIENTS:
        // TODO: Handle this case.
        break;
      case NoteType.PEST_CONTROL:
        // TODO: Handle this case.
        break;
      case NoteType.TRIM:
        // TODO: Handle this case.
        break;
      case NoteType.TRANING:
        // TODO: Handle this case.
        break;
      case NoteType.OTHER:
        // TODO: Handle this case.
        break;
    }
    return fields;
  }

  @override
  onValidSuccess(Note formValue) {
    if (widget.note != null) {
      NoteController.updateNote(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      formValue.plant = widget.plant;
      NoteController.addNote(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}

/**
 * NoteForm 数据逻辑
 **/
mixin _NoteFormMixin<T extends StatefulWidget> on State<T> {}
