import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustudient/pages/books.dart';
import 'package:ustudient/pages/newpost.dart';
import 'package:ustudient/pages/routes.dart';
import 'package:ustudient/pages/videos.dart';
import 'package:ustudient/user/chat.dart';
import 'package:ustudient/user/login.dart';
import 'package:ustudient/user/points.dart';
import 'package:ustudient/user/register.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;

  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  MyApp({required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: isUserLoggedIn ? "/" : "/login",
      initialRoute: "/",

      routes: {
        '/': (context) => routes(),
        '/login': (context) => login(),
        '/register': (context) => register(),
        '/chat': (context) => chat(),
        '/points': (context) => points(),
        '/books': (context) => books(),
        '/new_post': (context) => new_post(),
        '/videos': (context) => videos_screen()
      },
    );
  }
}
