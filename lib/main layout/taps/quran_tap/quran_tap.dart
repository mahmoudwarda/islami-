import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/models/sura_model.dart';

import 'Widget/most_recent_item.dart';
import 'Widget/quran_item.dart';

class QuranTap extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(AssetsManager.quranTabLogo),

          TextField(
            decoration: InputDecoration(
                prefixIcon: ImageIcon(
                    color: ColorsManager.gold,
                    AssetImage(AssetsManager.icQuran)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide( color: ColorsManager.gold,width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide( color: ColorsManager.gold, width: 1)
                ),
                labelText: "Sura Name",
                labelStyle: TextStyle(color: ColorsManager.ofWhite,fontWeight:FontWeight.w500,fontSize: 16)
            ),
          ),
          Text("Most Recently",style: TextStyle(color: ColorsManager.ofWhite),),

          SizedBox(
              height: MediaQuery.sizeOf(context).height *0.27,

              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(width: 5,) ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index)=> MostRecentItem(),itemCount: 20,)),
          Text("Suras List",style: TextStyle(color: Colors.white),),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context , index) =>Container(
                  margin: EdgeInsets.symmetric(horizontal: 64,vertical: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
                itemBuilder: (context, index) => QuranItem(suraModel: SuraModel.suras[index],index: index,), itemCount: 114),
          )
        ],
      ),
    );
  }

}