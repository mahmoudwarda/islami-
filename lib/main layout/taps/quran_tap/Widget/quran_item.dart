

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/routes_manager/routes_manager.dart';
import '../../../../models/sura_details_argument.dart';
import '../../../../models/sura_model.dart';
import '../../../../sura_details_screen/sura_details_screen.dart';
class QuranItem extends StatelessWidget {
  QuranItem({super.key,required this.suraModel,required this.index});
  SuraModel suraModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){

        Navigator.pushNamed(context,RoutesManager.SuraDetailsScreen,arguments: SuraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNum),
              Text("${index+1}",style: TextStyle(color: ColorsManager.ofWhite,fontSize: 14,fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(width: 16.w,),

          Column(
            children: [
              Text(suraModel.suraNameEn,style: TextStyle(color: ColorsManager.ofWhite,fontSize: 16,),),
              SizedBox(height: 8,),
              Text(suraModel.suraNumOfVerses,style: TextStyle(color: ColorsManager.ofWhite,fontSize: 16,),),

            ],
          ),
          Spacer(),
          Text(suraModel.suraNameAr,style: TextStyle(color: ColorsManager.ofWhite,fontSize: 16,),),


        ],
      ),
    );
  }
}