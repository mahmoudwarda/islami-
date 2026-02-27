
import 'package:flutter/material.dart';
import 'package:islami/main%20layout/taps/hadith_tap/hadith_tap.dart';
import 'package:islami/main%20layout/taps/quran_tap/quran_tap.dart';
import 'package:islami/main%20layout/taps/radio_tap/radio_tap.dart';
import 'package:islami/main%20layout/taps/sebha_tap/sebha_tap.dart';
import 'package:islami/main%20layout/taps/time_tap/time_tap.dart';

import '../core/resources/colors_manager.dart';

class MainLayout extends StatefulWidget{
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> Taps =[
    QuranTap(),
    HadithTap(),
    RadioTap(),
    SebhaTap(),
    TimeTap()
  ];

  int SelectedTap=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorsManager.black,
          ColorsManager.black//.withOpacity(0.7),
        ]),
      //  image: DecorationImage(image: AssetImage("assets/images/main_layout_bg.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Taps[SelectedTap],
        bottomNavigationBar: buildBottomNavBar()
      ),
    );
  }

  Widget buildBottomNavBar(){
    return BottomNavigationBar(
        currentIndex: SelectedTap,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: buildIconWidget("ic_quran.png",SelectedTap==0),label: "Quran"),
          BottomNavigationBarItem(icon: buildIconWidget("ic_hadeth.png",SelectedTap==1),label: "Hadeth"),
          BottomNavigationBarItem(icon: buildIconWidget("ic_sebha.png",SelectedTap==2),label: "Sebha"),
          BottomNavigationBarItem(icon: buildIconWidget("ic_radio.png",SelectedTap==3),label: "Radio"),
          BottomNavigationBarItem(icon: buildIconWidget("ic_time.png",SelectedTap==4),label: "Time"),
        ]);
  }

  void _onTap(int newIndex){
      SelectedTap = newIndex;
      setState(() {

      });
  }

Widget buildIconWidget(String imageName,bool isSelected){
    return isSelected ? Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
      decoration: BoxDecoration(
        color: ColorsManager.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(66)
      ),
      child: ImageIcon(AssetImage("assets/images/$imageName"))):ImageIcon(AssetImage("assets/images/$imageName"));

}
}