import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zapp/Config/PagePath.dart';
import 'package:zapp/Config/Themes.dart';
import 'package:zapp/Pages/Auth/AuthPage.dart';
import 'package:zapp/Pages/HomePage/HomePage.dart';
import 'package:zapp/Pages/SplashPage/SplashPage.dart';
import 'package:zapp/Pages/Welcome/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZAPP',
      theme: lightTheme,
      getPages: pagePath,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}