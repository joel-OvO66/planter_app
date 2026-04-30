import 'package:bruno/bruno.dart';
import 'package:bruno/src/components/picker/base/brn_picker_title_config.dart';
import 'package:bruno/src/components/picker/brn_picker_cliprrect.dart';
import 'package:bruno/src/components/picker/time_picker/brn_date_picker_constants.dart';
import 'package:bruno/src/components/picker/time_picker/brn_date_time_formatter.dart';
import 'package:bruno/src/components/picker/time_picker/date_range_picker/brn_date_range_widget.dart';
import 'package:bruno/src/components/picker/time_picker/date_range_picker/brn_time_range_widget.dart';
import 'package:bruno/src/theme/brn_theme.dart';
import 'package:bruno/src/utils/i18n/brn_date_picker_i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/generated/l10n.dart';
import 'package:planter_app/views/my_brn_date_range_widget.dart';
import 'package:planter_app/views/my_brn_time_range_widget.dart';

/// 从底部弹出时间范围选择 Picker
class MyBrnDateRangePicker {
  /// isDismissible[bool]点击背景是否自动消失
  /// minDateTime: [DateTime] 可选的最小时间
  /// maxDateTime: [DateTime] 可选的最大时间
  /// isLimitTimeRange: [bool] 是否显示开始时间必须小于等于结束时间，默认为 true，仅在 [BrnDateTimeRangePickerMode] 为 time 时生效
  /// initialDateTime: [DateTime] 初始化选中时间
  /// dateFormat: [String] 时间展示格式，如：yyyy 年 MM 月 dd 日
  /// minuteDivider：[int] 分钟展示间隔，默认值为 1
  /// locale: [DateTimePickerLocale] internationalization
  /// pickerMode: [BrnDateTimeRangePickerMode] 展示的 mode: date(DatePicker)、time(TimePicker)
  /// onCancel: [DateVoidCallback] 取消回调
  /// onClose: [DateVoidCallback] 关闭回调
  /// onChange: [DateValueCallback] 时间变化回调
  /// onConfirm: [DateValueCallback] 点击确认的回调
  /// pickerTitleConfig: [BrnPickerTitleConfig] Picker title 配置
  /// themeData: [BrnPickerConfig] 主题配置
  static void showDatePicker(
    BuildContext context, {
    bool isDismissible = true,
    DateTime? minDateTime,
    DateTime? maxDateTime,
    bool isLimitTimeRange = true,
    DateTime? initialStartDateTime,
    DateTime? initialEndDateTime,
    String? dateFormat,
    int minuteDivider = 1,
    DateTimePickerLocale locale = datetimePickerLocaleDefault,
    BrnDateTimeRangePickerMode pickerMode = BrnDateTimeRangePickerMode.date,
    BrnPickerTitleConfig pickerTitleConfig = BrnPickerTitleConfig.Default,
    DateVoidCallback? onCancel,
    DateVoidCallback? onClose,
    DateRangeValueCallback? onChange,
    DateRangeValueCallback? onConfirm,
    BrnPickerConfig? themeData,
    Widget? customWidget,
  }) {
    // handle the range of datetime
    if (minDateTime == null) {
      minDateTime = DateTime.parse(datePickerMinDatetime);
    }
    if (maxDateTime == null) {
      maxDateTime = DateTime.parse(datePickerMaxDatetime);
    }

    // handle initial DateTime
    if (initialStartDateTime == null) {
      initialStartDateTime = DateTime.now();
    }

    if (pickerMode == BrnDateTimeRangePickerMode.date) {
      customWidget = customWidget ?? Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(child: Text(S.of(context).date_month, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_day, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_year, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
              ],
            ),
          ),
          const Expanded(flex: 1, child: const SizedBox(width: 1,)),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(child: Text(S.of(context).date_month, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_day, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_year, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
              ],
            ),
          ),
        ],
      );
    } else {
      customWidget = customWidget ?? Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: Text(S.of(context).date_hour, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_minute, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
              ],
            ),
          ),
          const Expanded(flex: 1, child: const SizedBox(width: 1,)),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: Text(S.of(context).date_hour, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
                Expanded(child: Text(S.of(context).date_minute, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28.sp))),
              ],
            ),
          ),
        ],
      );
    }
    // Set value of date format
    dateFormat = DateTimeFormatter.generateDateRangePickerFormat(dateFormat, pickerMode);

    Navigator.push(
      context,
      _DatePickerRoute(
        minDateTime: minDateTime,
        maxDateTime: maxDateTime,
        isLimitTimeRange: isLimitTimeRange,
        initialStartDateTime: initialStartDateTime,
        initialEndDateTime: initialEndDateTime,
        dateFormat: dateFormat,
        minuteDivider: minuteDivider,
        pickerMode: pickerMode,
        pickerTitleConfig: pickerTitleConfig,
        onCancel: onCancel,
        onChange: onChange,
        onConfirm: onConfirm,
        isDismissible: isDismissible,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        themeData: themeData,
        customWidget: customWidget,
      ),
    ).whenComplete(onClose ?? () {});
  }
}

class _DatePickerRoute<T> extends PopupRoute<T> {
  final DateTime? minDateTime,
      maxDateTime,
      initialStartDateTime,
      initialEndDateTime;
  final bool isLimitTimeRange;
  final String? dateFormat;
  final BrnDateTimeRangePickerMode pickerMode;
  final BrnPickerTitleConfig pickerTitleConfig;
  final VoidCallback? onCancel;
  final DateRangeValueCallback? onChange;
  final DateRangeValueCallback? onConfirm;
  final int minuteDivider;
  final ThemeData? theme;
  final bool? isDismissible;
  BrnPickerConfig? themeData;
  final Widget? customWidget;

  _DatePickerRoute({
    this.minDateTime,
    this.maxDateTime,
    this.isLimitTimeRange = true,
    this.initialStartDateTime,
    this.initialEndDateTime,
    this.minuteDivider = 1,
    this.dateFormat,
    this.pickerMode = BrnDateTimeRangePickerMode.date,
    this.pickerTitleConfig = BrnPickerTitleConfig.Default,
    this.onCancel,
    this.onChange,
    this.onConfirm,
    this.theme,
    this.barrierLabel,
    this.isDismissible,
    this.themeData,
    RouteSettings? settings,
    this.customWidget
  }) : super(settings: settings) {
    this.themeData ??= BrnPickerConfig();
    this.themeData = BrnThemeConfigurator.instance
        .getConfig(configId: this.themeData!.configId)
        .pickerConfig
        .merge(this.themeData);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => isDismissible ?? true;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    double height = themeData!.pickerHeight;
    if (pickerTitleConfig.title != null || pickerTitleConfig.showTitle) {
      height += themeData!.titleHeight;
    }
    if(customWidget != null) {
      height += (themeData!.itemHeight * 0.6);
    }

    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: _DatePickerComponent(
        route: this,
        pickerHeight: height,
      ),
    );

    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }
    return bottomSheet;
  }
}

class _DatePickerComponent extends StatelessWidget {
  final _DatePickerRoute route;
  final double _pickerHeight;

  _DatePickerComponent({required this.route, required pickerHeight})
      : this._pickerHeight = pickerHeight;

  @override
  Widget build(BuildContext context) {
    Widget? pickerWidget;
    switch (route.pickerMode) {
      case BrnDateTimeRangePickerMode.date:
        pickerWidget = MyBrnDateRangeWidget(
          minDateTime: route.minDateTime,
          maxDateTime: route.maxDateTime,
          initialStartDateTime: route.initialStartDateTime,
          initialEndDateTime: route.initialEndDateTime,
          dateFormat: route.dateFormat,
          pickerTitleConfig: route.pickerTitleConfig,
          onCancel: route.onCancel,
          onChange: route.onChange,
          onConfirm: route.onConfirm,
          themeData: route.themeData,
          customWidget: route.customWidget,
        );
        break;
      case BrnDateTimeRangePickerMode.time:
        pickerWidget = MyBrnTimeRangeWidget(
          minDateTime: route.minDateTime,
          maxDateTime: route.maxDateTime,
          isLimitTimeRange: route.isLimitTimeRange,
          initialStartDateTime: route.initialStartDateTime,
          initialEndDateTime: route.initialEndDateTime,
          minuteDivider: route.minuteDivider,
          dateFormat: route.dateFormat,
          pickerTitleConfig: route.pickerTitleConfig,
          onCancel: route.onCancel,
          onChange: route.onChange,
          onConfirm: route.onConfirm,
          themeData: route.themeData,
          customWidget: route.customWidget,
        );
        break;
    }

    // if (route.customWidget != null) {
    //   pickerWidget = Stack(children: [
    //     Positioned(left: 0, top: 0, bottom: 0, right: 0, child: pickerWidget),
    //     Positioned(left: 0, right: 0, top: 50, child: Container(child: route.customWidget),),
    //   ]);
    // }

    return GestureDetector(
      child: AnimatedBuilder(
        animation: route.animation!,
        builder: (BuildContext context, Widget? child) {
          return ClipRect(
            child: CustomSingleChildLayout(
              delegate:
                  _BottomPickerLayout(route.animation!.value, _pickerHeight),
              child: BrnPickerClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(route.themeData!.cornerRadius),
                  topRight: Radius.circular(route.themeData!.cornerRadius),
                ),
                child: pickerWidget,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomPickerLayout extends SingleChildLayoutDelegate {
  _BottomPickerLayout(this.progress, this.contentHeight);

  final double progress;
  final double contentHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: contentHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_BottomPickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
