import 'package:get/get.dart';
import 'package:zapp/Pages/Chat/ChatPage.dart';

import '../Pages/Auth/AuthPage.dart';
import '../Pages/ContactPage/ContactPage.dart';
import '../Pages/Home/HomePage.dart';
import '../Pages/ProfilePage/ProfilePage.dart';

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
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactPage(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 600),
  ),




  // GetPage(
  //   name: "/updateProfilePage",
  //   page: () => UserUpdateProfile(),
  //   transition: Transition.rightToLeftWithFade,
  //   transitionDuration: const Duration(milliseconds: 600),
  // ),


];