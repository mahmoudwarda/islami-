import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/resources/colors_manager.dart';
import 'package:islami/models/sura_details_argument.dart';
import '../core/resources/assets_manager.dart';
import '../models/sura_model.dart';
class suraDetailsScreen extends StatefulWidget {
  @override
  State<suraDetailsScreen> createState() => _suraDetailsScreenState();
}

class _suraDetailsScreenState extends State<suraDetailsScreen> {
  List<String> verses =[];
  bool isLoaded = false;
  List <String> suraContent = [];
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isLoaded) {
      final SuraModel sura =
      ModalRoute
          .of(context)!
          .settings
          .arguments as SuraModel;
      isLoaded = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    suraDetailsArgument arguments = ModalRoute.of(context)?.settings.arguments as suraDetailsArgument;
    if(suraContent.isEmpty) loudSuraContent(arguments.index+1);
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.suraModel.suraNameEn),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(AssetsManager.quranDetailsLeft),
              Spacer(),
              Text(arguments.suraModel.suraNameAr,style: TextStyle(color: ColorsManager.gold,fontSize: 24),textAlign: TextAlign.center,),
              Spacer(),
              Image.asset(AssetsManager.quranDetailsRight),
            ],
          ),
          Expanded(
              child: suraContent.isEmpty ? Center(child: CircularProgressIndicator(color: ColorsManager.gold,)):
              Text(verses as String,style: TextStyle(color: ColorsManager.gold,fontSize: 20,fontWeight: FontWeight.bold),)
          )

        ],
      ),
    );
  }

  void loudSuraContent(int index)async{
    String filePath = "assets/files/Suras/$index.txt";
    String fileContent =await rootBundle.loadString(filePath);
    verses = fileContent.trim().split("\n");
    await Future.delayed(Duration(seconds: 1));
    for(int i=0;i< verses.length;i++){
      verses[i]+="[${i+1}]";
    }
    suraContent = verses;
    setState(() {

    });


  }
}