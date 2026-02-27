import 'package:flutter/cupertino.dart';
import 'package:islami/splash_route.dart';
import 'package:islami/sura_details_screen.dart';

import '../../main layout/main_layout.dart';
import '../../sura_details_screen/sura_details_screen.dart';

class RoutesManager {
  static const String splashRoute="/splashRoute";
  static const String mainLayout="/mainLayout";
  static const String SuraDetailsScreen="/SuraDetailsScreen";

 static Route? getRoute(RouteSettings settings){
   switch (settings.name){
     case splashRoute:
       return CupertinoPageRoute(builder: (context)=> SplashRoute());
     case mainLayout:
       return CupertinoPageRoute(builder: (context)=> MainLayout());
     case SuraDetailsScreen:
       return CupertinoPageRoute(builder: (context)=> suraDetailsScreen(),settings: settings);
   }
 }
}