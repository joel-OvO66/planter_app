import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../api/TianHeController.dart';
import '../../common/FarmService.dart';
import '../../entity/farm/entity/Farm.dart';
import '../../gen/assets.gen.dart';

/**
* WeatherWidget 主类
**/
class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

/**
* WeatherWidget UI布局
**/
class _WeatherWidgetState extends State<WeatherWidget> with _WeatherWidgetMixin {
  late TianHeController tianHe;

  final ValueNotifier<String> cityCounter = ValueNotifier<String>("California");
  final ValueNotifier<String> weatherCounter = ValueNotifier<String>("Cloudy");
  final ValueNotifier<String> tempCounter = ValueNotifier<String>("28");
  @override
  void initState() {
    super.initState();
    tianHe = TianHeController();
    tianHe.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildCurrentFarmWeather(),
    );
  }

  List<Widget> _buildCurrentFarmWeather() {
    bool queryWeather = false;
    Farm? currentMember = context.select<FarmService, Farm?>((FarmService pp) => pp.currentFarm);

    /// 防止天气无限刷新, 其他页面打开键盘 DashboardPage也会刷新????
    // if (cacheMember?.farmId != currentMember?.farmId) {
    //   cacheMember = currentMember;
    //   queryWeather = true;
    // }
    if (currentMember == null) {
      return [Text("Add your first farm.", style: Theme.of(context).textTheme.labelMedium)];
    } else {
      Farm currentFarm = currentMember;
      if (currentFarm.point != null && queryWeather) {
        tianHe.getRealTimeWeather(currentFarm.point!.lat, currentFarm.point!.lng).then((value) {
          if (value == null) {
            return;
          }
          weatherCounter.value = value['now']['text'];
          tempCounter.value = value['now']['temp'];
          tianHe.getCityName(currentFarm.point!.lat, currentFarm.point!.lng).then((value) {
            if (value == null) {
              return;
            }
            cityCounter.value = value['location'][0]['adm1'];
          });
        });
      }
      return [
        Assets.images.homeLocation.image(width: 24.sp),
        SizedBox(width: 8.sp),
        ValueListenableBuilder<String>(
          valueListenable: cityCounter,
          builder: (context, value, child) {
            return Text(value, style: Theme.of(context).textTheme.labelMedium);
          },
        ),
        Container(
          width: 0.5, // Width of the vertical line
          height: 20.sp, // Height of the vertical line
          color: Colors.white70, // Color of the vertical line
          margin: EdgeInsets.symmetric(horizontal: 16.sp), // Optional: Add some spacing around the vertical line
        ),
        ValueListenableBuilder<String>(
          valueListenable: tempCounter,
          builder: (context, value, child) {
            return Text("$value℃", style: Theme.of(context).textTheme.labelMedium);
          },
        ),
        SizedBox(width: 8.sp),
        ValueListenableBuilder<String>(
          valueListenable: weatherCounter,
          builder: (context, value, child) {
            return Text(value, style: Theme.of(context).textTheme.labelMedium);
          },
        ),
      ];
    }
  }
}

/**
* WeatherWidget 数据逻辑
**/
mixin _WeatherWidgetMixin<T extends StatefulWidget> on State<T> {}
