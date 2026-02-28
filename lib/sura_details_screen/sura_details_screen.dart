import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/resources/assets_manager.dart';
import '../core/resources/colors_manager.dart';
import '../models/sura_details_argument.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraContent = [];

  @override
  Widget build(BuildContext context) {
    final SuraDetailsArgument arguments =
    ModalRoute.of(context)!.settings.arguments as SuraDetailsArgument;

    if (suraContent.isEmpty) {
      loadSuraContent(arguments.index + 1);
    }

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
              Text(
                arguments.suraModel.suraNameAr,
                style: TextStyle(color: ColorsManager.gold, fontSize: 24),
              ),
              Spacer(),
              Image.asset(AssetsManager.quranDetailsRight),
            ],
          ),
          Expanded(
            child: suraContent.isEmpty
                ? Center(
              child: CircularProgressIndicator(
                color: ColorsManager.gold,
              ),
            )
                : ListView.builder(
              itemCount: suraContent.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    suraContent[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraContent(int index) async {
    String filePath = "assets/files/Suras/$index.txt";
    String fileContent = await rootBundle.loadString(filePath);

    List<String> verses = fileContent.trim().split("\n");

    for (int i = 0; i < verses.length; i++) {
      verses[i] += " [${i + 1}]";
    }

    setState(() {
      suraContent = verses;
    });
  }
}