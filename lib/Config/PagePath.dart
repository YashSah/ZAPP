import 'package:get/get.dart';
import 'package:zapp/Pages/Chat/ChatPage.dart';

import '../Pages/Auth/AuthPage.dart';
import '../Pages/Home/HomePage.dart';

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
  GetPage(
    name: "/chatPage",
    page: () => ChatPage(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 600),
  ),
];