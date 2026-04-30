
import 'package:bruno/bruno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/form/FormItem.dart';

import 'FormFieldBuilderHelper.dart';

class MultiChoiceInputFormItemField<T> extends FormField  {
  MultiChoiceInputFormItemField({
    prefixIconType = BrnPrefixIconType.normal,
    title,
    subTitle,
    tipLabel,
    isRequire = false,
    List<FormItem<T>>? formItems,
     initialValue,
    onSaved,
    onChanged,
    validator,
    isEdit = true,
    validators,
    autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
      validator: validator != null ? validator : (v) => FormFieldBuilderHelper.validate(v, validators),
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      builder: (FormFieldState  field) {
        List fieldValues= field.value !=null? field.value as List:[];
        List<String>?  values=formItems?.where((element) => fieldValues.contains(element.value)   ).map((e) => e.label).toList();
        return BrnMultiChoiceInputFormItem(
          prefixIconType: prefixIconType,
          error: field.errorText ?? "",
          title: title,
          isEdit: isEdit,
          subTitle: subTitle,
          tipLabel: tipLabel,
          isRequire: isRequire,
          themeData: BrnFormItemConfig(optionsMiddlePadding:EdgeInsets.only(left: 18.sp)),
          options: formItems!.map((e) => e.label).toList(),
          value: values??[],
          onTip: () {},
          onAddTap: () {},
          onRemoveTap: () {},
          onChanged: (List<String> oldValue, List<String> newValue) {
            List  fieldValue = formItems.where((element) =>  newValue.contains(element.label)).map((e) => e.value).toList();
            field.didChange(fieldValue  );
            if (onChanged != null) {
              onChanged(fieldValue);
            }
          },
        );
      },
      onSaved: onSaved);
}