import 'package:flutter/cupertino.dart';
import 'package:planter_app/generated/l10n.dart';

class Validator {

  static ValidatorFn? customize(FormFieldValidator<dynamic>? fn) {
    return ValidatorFn('customize', fn!);
  }

  static ValidatorFn? idCardNo(BuildContext context) {
    return ValidatorFn('idCardNo', (value) {
      return _isCardId(context, value!);
    });
  }

  static ValidatorFn? email(BuildContext context) {
    RegExp regExp = new RegExp(r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$');
    return ValidatorFn('email', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_email_format_err_tip;
    });
  }

  static ValidatorFn? phone(BuildContext context, [dynamic value]) {
    RegExp regExp = new RegExp(r'^1(3[0-9]|4[014-9]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\d{8}$');
    return ValidatorFn('phone', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_phone_format_err_tip;
    });
  }

  static ValidatorFn? isNumber(BuildContext context, [dynamic value]) {
    RegExp regExp = new RegExp(r'^[0-9]*$');
    return ValidatorFn('isNumber', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_must_be_integer;
    });
  }

  static ValidatorFn? isDoubleNumber(BuildContext context, [dynamic value]) {
    RegExp regExp = new RegExp(r'^[0-9]+(.[0-9]{1,2})?$');
    return ValidatorFn('isDoubleNumber', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_must_numeric_more_tow_d;
    });
  }

  /**
   * 精确到小数点后三位
   */
  static ValidatorFn? isDoubleNumberForLength(BuildContext context, [dynamic value]) {
    RegExp regExp = new RegExp(r'^[0-9]+(.[0-9]{1,3})?$');
    return ValidatorFn('isDoubleNumberForLength', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_must_numeric_more_three_d;
    });
  }

  static ValidatorFn? pattern(BuildContext context, String source, [dynamic value]) {
    RegExp regExp = new RegExp(source);
    return ValidatorFn('pattern', (value) {
      return regExp.hasMatch(value!) ? null : S.of(context).valid_format_error;
    });
  }

  static ValidatorFn? required(BuildContext context) {
    return ValidatorFn('required', (value) {
      if (value == null) {
        return S.of(context).valid_required_not_empty_tip;//" 不能为空";
      } else if (value is String){
        return value.trim().length > 0 ? null : S.of(context).valid_required_not_empty_tip;
      } else {
        return null;
      }
    });
  }

  static ValidatorFn? maxLength(BuildContext context, int maxLength) {
    return ValidatorFn('maxLength', (value) {
      return value!.trim().length > maxLength ? "${S.of(context).valid_len_no_more_than}$maxLength" : null; //长度不能超过
    });
  }

  static ValidatorFn? minLength(BuildContext context, int minLength) {
    return ValidatorFn('minLength', (value) {
      return value!.trim().length < minLength ? "${S.of(context).valid_len_no_less_than}$minLength" : null; //长度不能少于
    });
  }

  static ValidatorFn? min(BuildContext context, int min) {
    return ValidatorFn('min', (value) {
      try {
        int v = int.parse(value!);
        return v < min ? "${S.of(context).valid_no_less_than}$min" : null; // 不能低于
      } on Exception {
        return null;
      }
    });
  }

  static ValidatorFn? max(BuildContext context, int max) {
    return ValidatorFn('max', (value) {
      try {
        int v = int.parse(value!);
        return v > max ? "${S.of(context).valid_no_more_than}$max" : null; // 不能高于
      } on Exception {
        return null;
      }
    });
  }

  static ValidatorFn? doubleMin(BuildContext context, int min) {
    return ValidatorFn('doubleMin', (value) {
      try {
        double v = double.parse(value!);
        return v < min ? "${S.of(context).valid_no_less_than}$min" : null;
      } on Exception {
        return null;
      }
    });
  }

  static ValidatorFn? doubleMax(BuildContext context, double max) {
    return ValidatorFn('doubleMax', (value) {
      try {
        double v = double.parse(value!);
        return v > max ? "${S.of(context).valid_no_more_than}$max" : null;
      } on Exception {
        return null;
      }
    });
  }

  static String? _isCardId(BuildContext context, String cardId) {
    if (cardId.length != 18) {
      return S.of(context).valid_identity_card_too_short; // 位数不够
    }
    // 身份证号码正则
    RegExp postalCode = new RegExp(
        r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$');
    // 通过验证，说明格式正确，但仍需计算准确性
    if (!postalCode.hasMatch(cardId)) {
      return S.of(context).valid_format_error;
    }
    //将前17位加权因子保存在数组里
    final List idCardList = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"];
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    final List idCardYArray = ['1', '0', '10', '9', '8', '7', '6', '5', '4', '3', '2'];
    // 前17位各自乖以加权因子后的总和
    int idCardWiSum = 0;

    for (int i = 0; i < 17; i++) {
      int subStrIndex = int.parse(cardId.substring(i, i + 1));
      int idCardWiIndex = int.parse(idCardList[i]);
      idCardWiSum += subStrIndex * idCardWiIndex;
    }
    // 计算出校验码所在数组的位置
    int idCardMod = idCardWiSum % 11;
    // 得到最后一位号码
    String idCardLast = cardId.substring(17, 18);
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if (idCardMod == 2) {
      if (idCardLast != 'x' && idCardLast != 'X') {
        return S.of(context).valid_identity_card_verify_err;
      }
    } else {
      //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
      if (idCardLast != idCardYArray[idCardMod]) {
        return S.of(context).valid_identity_card_verify_err;
      }
    }
    return null;
  }

}

class ValidatorFn {

  final String type;

  final FormFieldValidator<dynamic> fn;

  ValidatorFn(this.type, this.fn){}

  String? call(dynamic value) {
    return fn(value);
  }
}
