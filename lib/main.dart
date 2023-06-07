import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather/new/home.dart';
import 'package:get/get.dart';




int startHour = 12; // 12pm

void changeTheme() {
  final elapsedHours = DateTime.now().hour;

  
  if (elapsedHours >= 5 && elapsedHours < 17) {
    // 12pm to 12am 
    Get.changeThemeMode(ThemeMode.light);    
  } else {
   // 12am to 12pm
   Get.changeThemeMode(ThemeMode.dark);   
  }
}


void main() {
  Get.put(homePage());
  runApp(const MyApp());
   Timer(Duration(hours: startHour), changeTheme);
   
  changeTheme(); // Initial theme change
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        //  themeMode: Get.cha ? ThemeMode.dark : ThemeMode.light,
         debugShowCheckedModeBanner: false,
        initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => homePage(),
        )
      ],  theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent[100],
        appBarTheme: AppBarTheme(
          //backwardsCompatibility: false,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.white,
          //   statusBarIconBrightness: Brightness.dark,
          // ),
          backgroundColor: Colors.blueAccent[100],
          elevation: 0.0,
        ),
      ),
       darkTheme: ThemeData(
        scaffoldBackgroundColor: HexColor('262626'),
        appBarTheme: AppBarTheme(
       
          backgroundColor: HexColor('262626'),
          elevation: 0.0,
        ),
      ),
    );

  }
}
