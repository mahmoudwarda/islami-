import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/core/routes_manager/routes_manager.dart';

class SplashRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    });
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset(SvgManager.islamiLogo),
            Spacer(
              flex: 1,
            ),
            Image.asset(AssetsManager.brandingLogo),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}