import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tornado/theme.dart';

import 'AppTheme.dart';

class BrunoThemeConfig {
  static BrnAllThemeConfig lightBrnTheme() {
    return BrnAllThemeConfig(
        configId: GLOBAL_CONFIG_ID,
        commonConfig: BrnCommonConfig(brandPrimary: const Color(0xff146029), brandAuxiliary: const Color(0xff84aa8e)),
        // 这里添加dialog配置
        dialogConfig: BrnDialogConfig(
          radius: 12.0,
        ),
        buttonConfig: BrnButtonConfig(bigButtonRadius: 49.sp, smallButtonRadius: 49.sp),
        pairRichInfoGridConfig: BrnPairRichInfoGridConfig(
          itemSpacing: 1.sp,
          keyTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 24.sp)),
          valueTextStyle: BrnTextStyle(fontSize: 24.sp),
        ),
        pairInfoTableConfig: BrnPairInfoTableConfig(
          keyTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 24.sp)),
          valueTextStyle: BrnTextStyle(fontSize: 24.sp),
        ),
        formItemConfig: BrnFormItemConfig(
            backgroundColor: Colors.white,
            headTitleTextStyle: BrnTextStyle(fontSize: 28.sp, color: AppTheme.textColorBlack),
            titleTextStyle: BrnTextStyle(fontSize: 28.sp, color: AppTheme.textColorBlack),
            optionTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorBlack),
            optionSelectedTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 26.sp).copyWith(color: AppTheme.primary)),
            optionsMiddlePadding: EdgeInsets.only(top: 0, bottom: 0),
            contentTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorBlack),
            disableTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorBlack),
            hintTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.placeholderColor),
            formPadding: EdgeInsets.only(left: 12.sp, top: 20.sp, right: 32.sp, bottom: 20.sp)),
        abnormalStateConfig: BrnAbnormalStateConfig(
          titleTextStyle: BrnTextStyle(color: AppTheme.textColor),
          contentTextStyle: BrnTextStyle(fontSize: 24.sp),
          operateTextStyle: BrnTextStyle(color: AppTheme.textColor, fontSize: 12.sp),
        ),
        cardTitleConfig: BrnCardTitleConfig(
            cardBackgroundColor: Colors.transparent,
            cardTitlePadding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
            titleTextStyle: BrnTextStyle(fontSize: 13),
            accessoryTextStyle: BrnTextStyle(fontSize: 13),
            subtitleTextStyle: BrnTextStyle(fontSize: 12)),
        pickerConfig: BrnPickerConfig(
          itemTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 26.sp)),
          itemTextSelectedStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 26.sp)),
        ));
  }

  static BrnAllThemeConfig darkBrnTheme() {
    return BrnAllThemeConfig(
        configId: BRUNO_CONFIG_ID,
        commonConfig: BrnCommonConfig(brandPrimary: const Color(0xff146029), brandAuxiliary: const Color(0xff84aa8e)),
        // 这里添加dialog配置
        dialogConfig: BrnDialogConfig(
          radius: 12.0,
        ),
        buttonConfig: BrnButtonConfig(bigButtonRadius: 49.sp, smallButtonRadius: 49.sp),
        pairRichInfoGridConfig: BrnPairRichInfoGridConfig(
          keyTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 24.sp, color: Color.fromRGBO(16, 16, 16, 0.55))),
          valueTextStyle: BrnTextStyle(fontSize: 24.sp, color: AppTheme.textColorWhite),
        ),
        enhanceNumberCardConfig: BrnEnhanceNumberCardConfig(
          titleTextStyle: BrnTextStyle(fontSize: 28.sp, color: AppTheme.textColorWhite),
          descTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorWhite),
          itemRunningSpace: 2.sp,
        ),
        formItemConfig: BrnFormItemConfig(
            backgroundColor: Colors.black,
            headTitleTextStyle: BrnTextStyle(fontSize: 28.sp, color: AppTheme.textColorWhite),
            titleTextStyle: BrnTextStyle(fontSize: 28.sp, color: AppTheme.textColorWhite),
            optionTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorWhite),
            optionSelectedTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 26.sp).copyWith(color: AppTheme.primary)),
            optionsMiddlePadding: EdgeInsets.only(top: 0, bottom: 0),
            contentTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorWhite),
            hintTextStyle: BrnTextStyle(fontSize: 26.sp, color: AppTheme.textColorWhite),
            formPadding: EdgeInsets.only(left: 12.sp, top: 20.sp, right: 32.sp, bottom: 20.sp)),
        abnormalStateConfig: BrnAbnormalStateConfig(
          titleTextStyle: BrnTextStyle(color: AppTheme.textColorWhite),
          contentTextStyle: BrnTextStyle(color: AppTheme.textColorWhite, fontSize: 24.sp),
          operateTextStyle: BrnTextStyle(color: AppTheme.textColorWhite, fontSize: 12.sp),
        ),
        cardTitleConfig: BrnCardTitleConfig(
            cardBackgroundColor: Colors.transparent,
            cardTitlePadding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
            titleTextStyle: BrnTextStyle(fontSize: 13),
            accessoryTextStyle: BrnTextStyle(fontSize: 13),
            subtitleTextStyle: BrnTextStyle(fontSize: 12)),
        pickerConfig: BrnPickerConfig(
          itemTextStyle: BrnTextStyle.withStyle(TextStyle(fontSize: 12.sp)),
        ));
  }
}
