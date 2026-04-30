import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:tornado/form/FormItem.dart';

import 'FormFieldBuilderHelper.dart';

class MultiSelectFormField<T> extends FormField<List<T>> {
  MultiSelectFormField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    List<FormItem<T>>? formItems,
    initialValue,
    onSaved,
    onChanged,
    placeholder,
    validator,
    validators,
    maxSelectItemCount = 0,
    crossAxisCount = 4,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<List<T>> field) {
              String? value = null;
              if (formItems != null) {
                int index = formItems.indexWhere((element) => element.value == field.value);
                if (index > 0) {
                  value = formItems[index].label;
                }
              }
              List<T>? values = field.value;
              return BrnTextSelectFormItem(
                prefixIconType: prefixIconType,
                isRequire: isRequire,
                hint: placeholder ?? "",
                error: field.errorText ?? "",
                title: title,
                value: value,
                subTitle: subTitle,
                tipLabel: tipLabel,
                onTip: () {},
                onAddTap: () {},
                onRemoveTap: () {},
                onTap: () {
                  List<BrnTagItemBean> items = [];
                  for (int i = 0; i < formItems!.length; i++) {
                    FormItem it = formItems[i];
                    BrnTagItemBean item = BrnTagItemBean(name: it.label, code: it.value.toString(), index: i, isSelect: value?.contains(it.value.toString())??false);
                    items.add(item);
                  }
                  BrnMultiSelectTagsPicker(
                    context: field.context,
                    //排列样式 默认 平均分配排序
                    layoutStyle: BrnMultiSelectTagsLayoutStyle.average,
                    //一行多少个 默认4个
                    crossAxisCount: crossAxisCount,
                    //最大选中数目 - 不设置 或者设置为0 则可以全选
                    maxSelectItemCount: maxSelectItemCount,
                    onItemClick: (BrnTagItemBean onTapTag, bool isSelect) {
                      // BrnToast.show(onTapTag.toString(), field.context);
                    },
                    onMaxSelectClick: () {
                      BrnToast.show('最大数值不能超过5个', field.context);
                    },
                    pickerTitleConfig: BrnPickerTitleConfig(
                      titleContent: title,
                    ),
                    tagPickerConfig: BrnTagsPickerConfig(
                      tagItemSource: items,
                      tagTitleFontSize: 12,
                      chipPadding: EdgeInsets.only(left: 5, right: 5),
                      tagTitleColor: Color(0xFF666666),
                      tagBackgroudColor: Color(0xffF8F8F8),
                      selectedTagBackgroudColor: Color(0x140984F9),
                      selectedTagTitleColor: Color(0xFF0984F9),
                    ),
                    onConfirm: (value) {
                      // BrnToast.show(value.toString(), field.context);
                    },
                    onCancel: () {
                      // BrnToast.show('点击了取消按钮', field.context);
                    },
                    onTagValueGetter: (choice) {
                      return choice.name;
                    },
                  ).show();
                },
              );
            });
}
