
import 'package:exp1_10_29/pages/about_auth/about_auth_pagr.dart';
import 'package:exp1_10_29/pages/mycollects/mycollects_page.dart';
import 'package:exp1_10_29/pages/search/search_page.dart';
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
        var map = settings.arguments as Map;
           //接收参数，转化为map
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
      case RouteName.search:
        var map = settings.arguments as Map;
        return pageRoute(
            SearchPage(keyword: "${map["search_text"]}"),
          settings: settings);
      case RouteName.mycollects:
        return pageRoute(
            MyCollectsPage(),
            settings: settings);
      case RouteName.about:
        return pageRoute(
            Aboutpage(),
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
  static const String search = '/search';
  static const String mycollects = '/mycollects';
  static const String about = '/about';
}