import 'package:get/get.dart';
import 'package:zapp/Pages/HomePage/HomePage.dart';

import '../Pages/Auth/AuthPage.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: ()=> AuthPage(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 600),
  ),
];