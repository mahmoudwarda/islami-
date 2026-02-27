import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/config/theme/theme_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/routes_manager/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 862),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context ,child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.getRoute,
          initialRoute: RoutesManager.splashRoute,
          theme: ThemeManager.light
      ),
    );
  }
  
}