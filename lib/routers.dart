import 'package:flutter/material.dart';
import 'package:planter_app/views/setting/FarmsPage.dart';


Map<String, WidgetBuilder> routers = {
  //资产管理
  "farm/farms": (context) => FarmsPage(),

};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  Function? pageContentBuilder = routers[settings.name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null && settings.arguments is String) {
      var route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context,
              argument: settings.arguments as String));
      return route;
    } else {
      var route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
}