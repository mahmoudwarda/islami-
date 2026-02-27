import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';

class ThemeManager {
  static final ThemeData light =  ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,
      appBarTheme: AppBarThemeData(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.gold,
        centerTitle: true,
      ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.gold,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: ColorsManager.black ,
      )
  );
}