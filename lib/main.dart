import 'package:exp1_10_29/http/dio_instance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'pages/home/home_page.dart';
import './route/routes.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();  //用工厂类构造了_MyHomePageState类
}
class _MyHomePageState extends State<MyHomePage> {   //重载_MyHomePageState类
  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child:ScreenUtilInit(
        builder: (context,child) {
          return MaterialApp(
            title: 'Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: Routes.generateRoute,   //导入配置好的路由
            initialRoute: RouteName.home,   //设置初始路由路径(String)
          );
        }
      )); // OKToast()

  }
}
