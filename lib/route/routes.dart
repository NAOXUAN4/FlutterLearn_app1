
import 'package:flutter/material.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/tab_page.dart';
import '../pages/webView_page.dart';
import '../pages/home/home_page.dart';
import '../pages/test/ScrollableWebViewPage.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.tab:
        return pageRoute(
            TabPage(),
            settings: settings);
      case RouteName.webViewPage:
        var map = settings.arguments as Map;   //接收参数，转化为map
        return pageRoute(
            WebViewPage(title:"${map["title"]}"),   //子页面构造参数"title"
            settings: settings);
      case RouteName.test:
        return pageRoute(
            ScrollableWebViewPage(),
            settings: settings);//给子页面传参
      case RouteName.login:
        return pageRoute(
            LoginPage(),
            settings: settings);
      case RouteName.register:
        return pageRoute(RegisterPage(),
            settings: settings);
      default:
        return pageRoute(
            HomePage(),
            settings: settings);

    }
  }

  static MaterialPageRoute pageRoute(Widget page,{ //定义MaterialPageRoute类型的 pageroute()
    RouteSettings ?settings,
    bool? fullscreenDialog = false,
    bool? maintainState = true,
    bool? allowSnapshotting
  }) {   //返回页面通用函数
    return MaterialPageRoute(builder: (context){
      return page;
    },
    settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true);
  }
}

class RouteName{
  static const String tab = '/';
  static const String webViewPage = '/webViewPage';
  static const String test = '/test';
  static const String login = '/login';
  static const String register = '/register';
}