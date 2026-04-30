import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pickers/address_picker/locations_data.dart';
import 'package:flutter_pickers/address_picker/route/address_picker_route.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/upload/UploadFile.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/util/FileBeanUtil.dart';
import 'package:tornado/widget/VideoItem.dart';
import 'package:tornado/widget/photo-view/photo-view-simple.dart';
import 'package:tornado/widget/skeleton/SimpleListSkeleton.dart';

import '../bean/FileInfo.dart';
import '../theme.dart';
import 'FormItem.dart';
import 'Validator.dart';

abstract class DefaultFormState<E, T extends StatefulWidget> extends State<T> {
  bool submitted = false;

  GlobalKey _formKey = new GlobalKey<FormState>();

  // 暂时废弃
  late E entity;

  /**
   * 密码框
   */
  TextFormField createPassword(String labelText, String hintText,
      {Color? borderColor, Color? focusBorderColor, String? initialValue, List<ValidatorFn?>? validators, Function? changed, Function? saved}) {
    return TextFormField(
      initialValue: initialValue,
      autofocus: true,
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})},
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(right: 10, top: 14, bottom: 6),
        labelText: labelText,
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor != null ? borderColor : ThemeColor.borderColor, width: 1)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: focusBorderColor != null ? focusBorderColor : ThemeColor.borderColor, width: 1)),
      ),
      // 校验用户名
      validator: (v) => _check(validators, v!),
    );
  }

  /**
   * 输入框较大，例如流程里面的流程表单的意见
   * createTextEvaluationField('意见', '请输入意见', validators: [Validator.maxLength(255)], changed: (value) {
   *  entity.comment = value;
   * })
   */
  Container createTextEvaluationField(String labelText, String hintText,
      {String? initialValue, bool? isFontBold, List<ValidatorFn?>? validators, Function? changed, Function? saved, int? numberLines}) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            alignment: Alignment.centerLeft,
            child: Text(labelText, style: TextStyle(color: Color(0xff20262E), fontSize: 16, fontWeight: isFontBold != null ? FontWeight.w400 : FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffE8E9EB)),
            ),
            child: TextFormField(
              initialValue: initialValue,
              maxLines: numberLines != null ? numberLines : 7,
              minLines: numberLines != null ? numberLines : 7,
              onSaved: (value) {
                setState(() {
                  saved == null ? {} : saved(value);
                });
              },
              onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})},
              decoration: InputDecoration(
                  hintText: hintText, hintStyle: TextStyle(color: ThemeColor.placeholderColor, fontSize: 14), focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
              // 校验用户名
              validator: (v) => _check(validators, v!),
            ),
          )
        ],
      ),
    );
  }

  /**
   * 注：setState(() {}) 刷新状态不会修改表单的值
   * 例子1：赋值后 需要修改该表单的值
   * TextEditingController editController = TextEditingController();
   * createTextFieldRow("故障名称", validators: [Validator.required()], saved: (value) => this.entity.faultName = value, controller: editController),
   * 修改值： editController.text = '已经修改';
   *
   * 例子2：赋值后 不需要修改该表单的值
   * createTextFieldRow("故障情况", saved: (value) => {this.entity.faultCondition = value}, initialValue: '初始值'),
   *
   * 注：用controller时 initialValue必须为null，看文档
   */
  Widget createTextFieldRow(String labelText,
      {String? initialValue,
      TextEditingController? controller,
      List<ValidatorFn?>? validators,
      TextInputType? keyboardType,
      Function? changed,
      Function? saved,
      bool? borderColor}) {
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    return Column(children: [
      CupertinoTextFormFieldRow(
        controller: controller,
        initialValue: initialValue,
        cursorHeight: 26.0,
        showCursor: true,
        cursorColor: Colors.blue,
        prefix: Container(
            height: 32.8,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808))),
              required ? Text(' *', style: TextStyle(color: Colors.red)) : SizedBox.shrink()
            ])),
        textAlign: TextAlign.right,
        onSaved: (value) {
          setState(() {
            saved == null ? {} : saved(value);
          });
        },
        onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})},
        placeholder: '请输入' + labelText,
        validator: (v) => _check(validators, v!),
        keyboardType: keyboardType,
      ),
      Divider(color: borderColor != null ? Colors.black12 : Color(0xffe2e4e3), height: 1, thickness: 1, indent: 16)
    ]);
  }

  /**
   * createRemarkFieldRow("备注", "请输入备注", initialValue: this.entity.remark, saved: (value) => this.entity.remark = value),
   */
  Container createRemarkFieldRow(String labelText, String hintText,
      {String? initialValue,
      bool? heightSmall,
      bool? fontBold,
      double? fontSize,
      List<ValidatorFn?>? validators,
      Function? changed,
      Function? saved,
      TextEditingController? controller,
      int? numberLines,
      bool? borderColor}) {
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    return Container(
      margin: EdgeInsets.fromLTRB(22, 4, 0, 4),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: required
                  ? Row(
                      children: [
                        Text(labelText,
                            style:
                                TextStyle(fontWeight: fontBold != null ? FontWeight.bold : FontWeight.w400, fontSize: fontSize != null ? fontSize : 14, color: Color(0xff080808))),
                        Text(' *', style: TextStyle(color: Colors.red))
                      ],
                    )
                  : Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808)))),
          TextFormField(
              controller: controller,
              initialValue: initialValue,
              // 校验用户名
              validator: (v) => _check(validators, v!),
              keyboardType: TextInputType.multiline,
              maxLines: numberLines != null ? numberLines : 5,
              minLines: numberLines != null ? numberLines : 5,
              onSaved: (value) {
                setState(() {
                  saved == null ? {} : saved(value);
                });
              },
              style: TextStyle(fontSize: 14, color: Color(0xff676f7b)),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Color(0xff959595)),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: heightSmall == null ? EdgeInsets.symmetric(horizontal: 0, vertical: 10) : EdgeInsets.fromLTRB(0, 10, 10, -20),
                isDense: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor != null ? Colors.black12 : ThemeColor.borderColor,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColor.borderColor,
                    width: 1,
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColor.borderColor,
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColor.borderColor,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})})
        ],
      ),
    );
  }

  SwitchListTile createSwitch(String labelText, {bool? initialValue, Function? changed}) {
    return SwitchListTile(
      title: Text(labelText, style: TextStyle(fontSize: 14)),
      value: initialValue ?? false,
      onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})},
    );
  }

  /**
   * createRadioField("是否含有煤气管道", yesOrNo, initialValue: this.entity.gasPipe, validators: [Validator.required()], changed: (value) {
   *  this.entity.gasPipe = value;
   * }),
   */
  Container createRadioField(String labelText, List<FormItem> items, {String? initialValue, List<ValidatorFn?>? validators, Function? changed}) {
    List<Widget> widgets = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    items.forEach((e) {
      widgets.add(Radio<String?>(
        value: e.value,
        groupValue: initialValue,
        onChanged: (value) => changed == null ? {} : {changed(value), setState(() {})},
      ));
      widgets.add(Text(e.label, style: TextStyle(fontSize: 14, color: Color(0xff959595))));
    });
    return Container(
        margin: EdgeInsets.fromLTRB(22, 0, 0, 4),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xffE8E9EB))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            required
                ? Row(
                    children: [Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808))), Text(' *', style: TextStyle(color: Colors.red))],
                  )
                : Text(labelText),
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Row(children: widgets),
            ),
          ],
        ));
  }

  /**
   * radio 内容为垂直布局，一般用于流程表单
   * createEvaluationRadioField("基建物资质保期", yesOrNo, initialValue: entity.qualityGuarantee, changed: (value) {
   *  entity.qualityGuarantee = value;
   * })
   */
  Container createEvaluationRadioField(String labelText, List<FormItem> items, {dynamic initialValue, List<ValidatorFn?>? validators, Function? changed}) {
    List<Widget> widgets = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    items.forEach((e) {
      widgets.add(Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Color(0xffE8E9EB))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              required
                  ? Row(
                      children: [Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808))), Text(' *', style: TextStyle(color: Colors.red))],
                    )
                  : Text(e.label),
              Radio<dynamic>(
                value: e.value,
                groupValue: initialValue,
                onChanged: (value) {
                  changed == null ? {} : {changed(value), setState(() {})};
                },
              ),
            ],
          )));
    });

    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: required
                ? Row(
                    children: [Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808))), Text(' *', style: TextStyle(color: Colors.red))],
                  )
                : Text(labelText, style: TextStyle(color: Color(0xff20262E), fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Column(children: widgets)
        ],
      ),
    );
  }

  /**
   * 时间选择器
   * createLocalDateTime("开始时间", initialValue: this.entity.startTime, validators: [Validator.required()], changed: (value) {
   *   this.entity.startTime = value;
   * }),
   */
  FormField<DateTime> createLocalDateTime(String labelText,
      {DateTime? initialValue, List<ValidatorFn?>? validators, Function? changed, Function? saved, DateTime? maxDate, DateTime? minDate, bool? borderColor}) {
    List<Widget> expandedChild = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    expandedChild.add(Text(
      labelText,
      style: TextStyle(fontSize: 14, color: Colors.black),
    ));
    if (required) {
      expandedChild.add(
        Container(
          margin: EdgeInsets.only(left: 6, top: 4),
          child: Text('*', style: TextStyle(color: Colors.red)),
        ),
      );
    }
    return FormField(
      initialValue: initialValue,
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      builder: (FormFieldState<Object> field) {
        return Container(
            height: 48,
            padding: EdgeInsets.only(right: 16),
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: borderColor != null ? Colors.black12 : ThemeColor.borderColor))),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                  Pickers.showDatePicker(
                    context,
                    // 模式，详见下方
                    mode: DateMode.YMDHMS,
                    // 后缀 默认Suffix.normal()，为空的话Suffix()
                    suffix: Suffix(years: ' 年', month: ' 月', days: ' 日', hours: ' 时', minutes: ' 分', seconds: ' 秒'),
                    // 默认选中
                    selectDate: initialValue != null ? PDuration.parse(initialValue) : null,
                    minDate: minDate != null ? PDuration.parse(minDate) : null,
                    maxDate: maxDate != null ? PDuration.parse(maxDate) : null,
                    onConfirm: (p) {
                      DateTime value = DateTime(p.year!, p.month!, p.day!, p.hour!, p.minute!, p.second!);
                      field.didChange(value);
                      changed == null ? {} : {changed(value), setState(() {})};
                    },
                  );
                },
                child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: Row(children: expandedChild),
                  ),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //右侧的默认日期时间和下拉箭头
                          children: [
                        // 回显日期
                        Text(
                          initialValue == null ? '请选择时间' : DateFormater.formatDateTime(initialValue),
                          style: TextStyle(fontSize: 14, color: Colors.black45),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 6),
                          child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
                        )
                      ]))
                ])));
      },
    );
  }

  /**
   * 日期选择器
   * createLocalDate("开始日期", DateFormater.formatDate(this.entity.startDate), validators: [Validator.required()], changed: (value) {
   *   this.entity.startDate = DateTime.tryParse(value);
   * }),
   */
  FormField<DateTime> createLocalDate(String labelText,
      {DateTime? initialValue, List<ValidatorFn?>? validators, Function? changed, Function? saved, DateTime? maxDate, DateTime? minDate}) {
    List<Widget> expandedChild = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    expandedChild.add(Text(
      labelText,
      style: TextStyle(fontSize: 14, color: Colors.black),
    ));
    if (required) {
      expandedChild.add(
        Container(
          margin: EdgeInsets.only(left: 6, top: 4),
          child: Text('*', style: TextStyle(color: Colors.red)),
        ),
      );
    }
    return FormField(
      initialValue: initialValue,
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      builder: (FormFieldState<Object> field) {
        return Column(children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: ThemeColor.borderColor, width: 1),
            )),
            height: 48,
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.only(right: 16),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (currentFocus.focusedChild != null) {
                  currentFocus.focusedChild!.unfocus();
                }
                Pickers.showDatePicker(
                  context,
                  // 模式，详见下方
                  mode: DateMode.YMD,
                  // 后缀 默认Suffix.normal()，为空的话Suffix()
                  suffix: Suffix(years: ' 年', month: ' 月', days: ' 日'),
                  // 默认选中
                  selectDate: initialValue != null ? PDuration.parse(initialValue) : null,
                  minDate: minDate != null ? PDuration.parse(minDate) : null,
                  maxDate: maxDate != null ? PDuration.parse(maxDate) : null,
                  onConfirm: (p) {
                    DateTime value = DateTime(p.year!, p.month!, p.day!);
                    field.didChange(value);
                    changed == null ? {} : changed(value);
                    setState(() {});
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(children: expandedChild),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //右侧的默认日期时间和下拉箭头
                    children: [
                      // 回显日期
                      Text(
                        initialValue == null ? '请选择' + labelText : DateFormater.formatDate(initialValue),
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
          field.errorText == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 16, top: 2, bottom: 20),
                  alignment: Alignment.topLeft,
                  child: Text(field.errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
                )
        ]);
      },
    );
  }

  /**
   * 单列选择器
   * List<FormItem<TaskType>> taskTypes = [];
   * HttpService.getList<TaskType>("task/getAllEnabledTaskTypes", fromJson: (e) => TaskType.fromJson(e)).then((List<TaskType> value) {
   *  taskTypes = value.map((v) => FormItem(v.typeName!, v)).toList();
   * });
   * createSinglePicker<TaskType>("任务类型", "请选择任务类型", taskTypes,
   *    initialValue: this.entity.taskType,
   *    validators: [Validator.required()],
   *    changed: (value) {
   *      this.entity.taskType = value;
   *    }
   *  ),
   */
  FormField<C> createSinglePicker<C>(String labelText, String hintText, List<FormItem<C>> items,
      {C? initialValue, List<ValidatorFn?>? validators, Function? changed, double? fontSize, Function? saved, String? itemsIsEmptyToast, bool? borderColor}) {
    var data = items.map((e) => e.label).toList();
    var selectData = '';
    if (initialValue != null && initialValue != '' && items.isNotEmpty) {
      selectData = items.firstWhere((element) => element.value == initialValue, orElse: () => FormItem('', initialValue)).label;
    }
    List<Widget> expandedChild = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    expandedChild.add(Container(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          labelText,
          style: TextStyle(fontSize: fontSize != null ? fontSize : 14, color: Colors.black),
        )));
    if (required) {
      expandedChild.add(
        Container(
          margin: EdgeInsets.only(right: 6, top: 4),
          child: Text(' *', style: TextStyle(color: Colors.red)),
        ),
      );
    }
    return FormField(
      initialValue: initialValue,
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      builder: (FormFieldState<C> field) {
        return Column(
          children: [
            Container(
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: borderColor != null ? Colors.black12 : ThemeColor.borderColor, width: 1),
                )),
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (currentFocus.focusedChild != null) {
                        currentFocus.focusedChild!.unfocus();
                      }
                      if (data.isNotEmpty) {
                        Pickers.showSinglePicker(
                          context,
                          data: data,
                          selectData: selectData,
                          pickerStyle: PickerStyle(
                              commitButton: Container(
                                  child: Text(
                                    '确定',
                                  ),
                                  margin: EdgeInsets.only(right: 16))),
                          onConfirm: (var data, int position) {
                            var value = items.firstWhere((e) => e.label == data).value;
                            field.didChange(value);
                            changed == null ? {} : changed(value);
                            setState(() {});
                          },
                        );
                      } else {
                        if (itemsIsEmptyToast != null) {
                          Fluttertoast.showToast(msg: itemsIsEmptyToast);
                        }
                      }
                    },
                    child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(children: expandedChild),
                      Expanded(
                          child: Row(
                              //右侧的默认日期时间和下拉箭头
                              children: [
                            Expanded(
                                child: Text(
                              selectData != ''
                                  ? selectData
                                  : hintText == ''
                                      ? '请选择'
                                      : hintText,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 14, color: selectData != '' ? Colors.black : Colors.black45),
                            ))
                          ]))
                    ]))),
            field.errorText == null
                ? SizedBox.shrink()
                : Container(
                    margin: EdgeInsets.only(left: 16, top: 2, bottom: 20),
                    alignment: Alignment.topLeft,
                    child: Text(' ' + field.errorText!, style: TextStyle(color: Colors.red, fontSize: 13)),
                  )
          ],
        );
      },
    );
  }

  /**
   * 多选
   */
  Container createMultipleChoiceRow(String labelText, List items,
      {Color? borderColor,
      Color? dividerColor,
      String? initialValue,
      List<ValidatorFn?>? validators,
      Function? changed,
      Function? saved,
      TextEditingController? controller,
      int? numberLines}) {
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    return Container(
      margin: EdgeInsets.fromLTRB(22, 4, 0, 4),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: required
                  ? Row(
                      children: [Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808))), Text(' *', style: TextStyle(color: Colors.red))],
                    )
                  : Text(labelText, style: TextStyle(fontSize: 14, color: Color(0xff080808)))),
          Container(padding: EdgeInsets.only(bottom: 8, top: 8), color: Color(0xffF7F9FA), child: _buttons(items, borderColor, dividerColor)),
          // items.firstWhere((element) => element['isChecked'] == true)
          //     ? Text("")
          //     : Container(
          //         margin: EdgeInsets.only(left: 10),
          //         alignment: Alignment.centerLeft,
          //         child: Text('请选择' + labelText, style: fs12.copyWith(color: Colors.red)),
          //       )
        ],
      ),
    );
  }

  Widget _buttons(items, borderColor, dividerColor) {
    List<Widget> children = [];
    if (items != null && items!.isNotEmpty) {
      double forNum = items!.length / 4;
      var lastIndex = items!.length - 1;
      for (var i = 0; i < forNum.ceil(); i++) {
        int index = i * 4;
        children.add(Row(
          children: [
            index > lastIndex
                ? Text('')
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          items![index]['isChecked'] = !items![index]['isChecked'];
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 80, minWidth: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: !items![index]['isChecked'] ? ThemeColor.borderColor : Color(0xffdaebfe),
                              border: Border.all(width: 1, color: !items![index]['isChecked'] ? ThemeColor.borderColor : borderColor)),
                          child: Text(
                            items![index]['title'],
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: !items![index]['isChecked'] ? Colors.grey : borderColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
            index + 1 > lastIndex
                ? Text('')
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          items![index + 1]['isChecked'] = !items![index + 1]['isChecked'];
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 80, minWidth: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: !items![index + 1]['isChecked'] ? ThemeColor.borderColor : Color(0xffdaebfe),
                              border: Border.all(width: 1, color: !items![index + 1]['isChecked'] ? ThemeColor.borderColor : borderColor)),
                          child: Text(
                            items![index + 1]['title'],
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: !items![index + 1]['isChecked'] ? Colors.grey : borderColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
            index + 2 > lastIndex
                ? Text('')
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          items![index + 2]['isChecked'] = !items![index + 2]['isChecked'];
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 80, minWidth: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: !items![index + 2]['isChecked'] ? ThemeColor.borderColor : Color(0xffdaebfe),
                              border: Border.all(width: 1, color: !items![index + 2]['isChecked'] ? ThemeColor.borderColor : borderColor)),
                          child: Text(
                            items![index + 2]['title'],
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: !items![index + 2]['isChecked'] ? Colors.grey : borderColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
            index + 3 > lastIndex
                ? Text('')
                : Expanded(
                    child: GestureDetector(
                        onTap: () {
                          items![index + 3]['isChecked'] = !items![index + 3]['isChecked'];
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 80, minWidth: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: !items![index + 3]['isChecked'] ? ThemeColor.borderColor : Color(0xffdaebfe),
                              border: Border.all(width: 1, color: !items![index + 3]['isChecked'] ? ThemeColor.borderColor : borderColor)),
                          child: Text(
                            items![index + 3]['title'],
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: !items![index + 3]['isChecked'] ? Colors.grey : borderColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
          ],
        ));
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: dividerColor != null ? dividerColor : Colors.black12))),
      child: Column(
        children: children,
      ),
    );
  }

  /**
   * 省市区控件
   * createAddressPicker("所在省市区", this.entity.district! + ',' + this.entity.city! + ',' + this.entity.province!, validators: [Validator.required()], changed: (value) {
   *  this.entity.district = value[0];
   *  this.entity.city = value[1];
   *  this.entity.province = value[2];
   *  }),
   */
  FormField<String> createAddressPicker(String labelText, {String? initialValue, List<ValidatorFn?>? validators, Function? changed, Function? saved}) {
    String value = '请选择' + labelText;
    String initProvince = '';
    String initCity = '';
    String initTown = '';
    if (initialValue != null && initialValue != ',,') {
      List<String> codes = initialValue.split(',');
      List<String> names = Address.getCityNameByCode(provinceCode: codes[0], cityCode: codes[1], townCode: codes[2]);
      initProvince = names[0];
      initCity = names[1];
      initTown = names[2];
      value = names.join('-');
    }
    List<Widget> expandedChild = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    expandedChild.add(Text(
      labelText,
      style: TextStyle(fontSize: 14, color: Colors.black),
    ));
    if (required) {
      expandedChild.add(Container(
        margin: EdgeInsets.only(right: 6, top: 4),
        child: Text(' *', style: TextStyle(color: Colors.red)),
      ));
    }
    return FormField(
      initialValue: initialValue,
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      builder: (FormFieldState<String> field) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: ThemeColor.borderColor, width: 1),
              )),
              height: 48,
              padding: EdgeInsets.only(right: 16),
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                  _showAddressPicker(
                    context,
                    addAllItem: false,
                    initProvince: initProvince,
                    initCity: initCity,
                    initTown: initTown,
                    onConfirm: (p, c, t) {
                      List<String> cityCode = Address.getCityCodeByName(provinceName: p, cityName: c, townName: t);
                      field.didChange(p + '-' + c + '-' + t!);
                      changed == null ? {} : changed(cityCode);
                      setState(() {});
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(children: expandedChild),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //右侧的默认日期时间和下拉箭头
                      children: [
                        // 回显日期
                        Text(
                          field.value != null && field.value != ',,' ? field.value! : value,
                          style: TextStyle(fontSize: 14, color: Colors.black45),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 6),
                          child: SvgPicture.asset('assets/images/svg/arrow-down.svg', width: 12, height: 12, color: Colors.black54),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            field.errorText == null
                ? Container()
                : Container(
                    margin: EdgeInsets.only(left: 16, top: 2, bottom: 20),
                    alignment: Alignment.topLeft,
                    child: Text(field.errorText!, style: TextStyle(color: Colors.red, fontSize: 13)),
                  )
          ],
        );
      },
    );
  }

  /**
   * 有点击事件的Field
   */
  FormField<C> createClickableField<C>(String labelText, String hintText,
      {Color? color, C? initialValue, String? okText, List<ValidatorFn?>? validators, Function? changed, Function? saved, Function? onTap, bool? borderColor}) {
    List<Widget> expandedChild = [];
    bool required = false;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    expandedChild.add(Text(
      labelText,
      style: TextStyle(fontSize: 14, color: Colors.black),
    ));
    if (required) {
      expandedChild.add(
        Container(
          margin: EdgeInsets.only(right: 6, top: 4),
          child: Text(' *', style: TextStyle(color: Colors.red)),
        ),
      );
    }
    return FormField(
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      initialValue: initialValue,
      builder: (FormFieldState<C> field) {
        return Container(
          margin: EdgeInsets.only(left: 20),
          height: 48,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: borderColor != null ? Colors.black12 : ThemeColor.borderColor, width: 1),
          )),
          padding: EdgeInsets.only(right: 16),
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (currentFocus.focusedChild != null) {
                currentFocus.focusedChild!.unfocus();
              }
              if (onTap != null) {
                onTap((value) {
                  field.didChange(value);
                });
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(children: expandedChild),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //右侧的默认日期时间和下拉箭头
                  children: [
                    // 回显日期
                    Text(
                      initialValue == null
                          ? hintText
                          : okText == null
                              ? '完成'
                              : okText,
                      style: TextStyle(fontSize: 14, color: initialValue == null && color != null ? color : Color(0xff959595)),
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  /**
   * 文件上传
   * uploadFile("上传文件", this.entity.videos!, 'video/construcArea', changed: (fileBean) {
   *  this.entity.videos!.add(fileBean);
   * }, deleteCallback: (fileBean) {
   *  this.entity.videos!.remove(fileBean);
   * }),
   */
  FormField<String> uploadFile(String labelText, List<FileInfo> fileBeans, String directory,
      {Color? chipColor, List<ValidatorFn?>? validators, Function? changed, Function? saved, Function? deleteCallback, int? max = 10}) {
    List<Widget> children = [];
    bool required = false;
    bool showUploadButton = fileBeans.length < max!;
    if (validators != null) {
      required = validators.any((element) => element!.type == 'required');
    }
    fileBeans.forEach((fileBean) {
      var split = fileBean.filePath!.split('.');
      String suffix = split[split.length - 1];
      children.add(SimpleListSkeleton(
        name: fileBean.name,
        isCircle: false,
        arrowRight: false,
        leading: FileBeanUtil.assetsSvg(fileBean.extension),
        subTitle: DateFormater.formatDateTimeNoSecond(fileBean.lastModifiedDate),
        chipText: '下载',
        chipColor: chipColor != null ? chipColor : Colors.blue,
      ));
    });
    return FormField(
      initialValue: fileBeans.length == 0 ? '' : 'image',
      // 校验用户名
      validator: (v) => _check(validators, v),
      onSaved: (value) {
        setState(() {
          saved == null ? {} : saved(value);
        });
      },
      builder: (FormFieldState<Object> field) {
        return Container(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6, top: 4),
                    child: required ? Text('*', style: TextStyle(color: Colors.red)) : Text(''),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    child: Icon(Icons.drive_folder_upload_outlined, color: chipColor != null ? chipColor : Colors.blue, size: 18),
                  ),
                  Text(labelText, style: TextStyle(fontSize: 12))
                ],
              ),
              showUploadButton
                  ? Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: GestureDetector(
                          onTap: () {},
                          child: ElevatedButton(
                            child: Text("上传文件"),
                            onPressed: () {
                              // UploadFile(directory).pickFile((fileBean) {
                              //   changed == null ? {} : {changed(fileBean), setState(() {})};
                              // });
                            },
                          )),
                    )
                  : Text(""),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: children,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  /// 自定义 地区选择器
  /// [initProvince] 初始化 省
  /// [initCity]    初始化 市
  /// [initTown]    初始化 区
  /// [onChanged]   选择器发生变动
  /// [onConfirm]   选择器提交
  /// [addAllItem] 市、区是否添加 '全部' 选项     默认：true
  void _showAddressPicker(BuildContext context,
      {PickerStyle? pickerStyle,
      String initProvince: '',
      String initCity: '',
      String? initTown,
      bool addAllItem: true,
      AddressCallback? onChanged,
      AddressCallback? onConfirm,
      bool overlapTabBar = false}) {
    if (pickerStyle == null) {
      pickerStyle = DefaultPickerStyle();
    }
    if (pickerStyle.context == null) {
      pickerStyle.context = context;
    }
    Navigator.of(context, rootNavigator: overlapTabBar).push(AddressPickerRoute(
      pickerStyle: pickerStyle,
      initProvince: initProvince,
      initCity: initCity,
      initTown: initTown,
      onChanged: onChanged,
      onConfirm: onConfirm,
      addAllItem: addAllItem,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }

  get formKey {
    return _formKey;
  }

  String? _check<C>(List<ValidatorFn?>? validators, C? v) {
    if (validators != null && validators.isNotEmpty) {
      bool required = validators.any((element) => element!.type == 'required');
      if ((v == null || v is String && v.isEmpty) && !required) {
        return null;
      }
      for (var element in validators) {
        if (element != null) {
          String? error = element.call(v);
          if (error != null) {
            return error;
          }
        }
      }
    } else {
      return null;
    }
  }

  Widget buildFormLabel(String label, bool require) {
    return Container(
        child: Row(
          children: [Text(label, style: Theme.of(context).textTheme.labelSmall), if (require) Text(' *', style: TextStyle(color: Colors.red))],
        ),
        margin: EdgeInsets.only(left: 26, top: 12));
  }

  Widget buildCupertinoLabel(String label, bool require) {
    return Row(
      children: [Text(label, style: Theme.of(context).textTheme.labelSmall), if (require) Text(' *', style: TextStyle(color: Colors.red))],
    );
  }

  String? validate<C>(List<ValidatorFn?>? validators, C? v) {
    if (validators != null && validators.isNotEmpty) {
      bool required = validators.any((element) => element!.type == 'required');
      if ((v == null || v is String && v.isEmpty) && !required) {
        return null;
      }
      for (var element in validators) {
        if (element != null) {
          String? error = element.call(v);
          if (error != null) {
            return error;
          }
        }
      }
    } else {
      return null;
    }
  }

  //  String localUrlHandle(String url) {
  //   String local = 'http://127.0.0.1:6001/';
  //   bool isLocal = url.startsWith(local);
  //   return isLocal ? url.replaceFirst(local, Constants.BASE_URL): url;
  // }

  void submitForm() {
    if (!this.submitted) {
      FormState formState = (_formKey.currentState as FormState);
      formState.save();
      if (formState.validate()) {
        this.submitted = true;
        this.onValidSuccess(entity);
      } else {
        this.submitted = false;
      }
    }
  }

  void resetForm() {
    FormState formState = (_formKey.currentState as FormState);
    formState.reset();
  }

  @protected
  @factory
  onValidSuccess(E formValue);
}
