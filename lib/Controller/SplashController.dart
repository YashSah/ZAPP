
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zapp/Pages/Welcome/WelcomePage.dart';

class SplashController extends GetxController {

  final auth = FirebaseAuth.instance;

  void onInit() async {
    super.onInit();
    await splashHandle();
  }


  Future<void> splashHandle() async {
    Future.delayed(Duration(seconds: 3),() {
      if(auth.currentUser == null) {
        Get.off(WelcomePage());
      } else {
        Get.offAllNamed("/homePage");
        print(auth.currentUser!.email);
      }
    });
  }
  
}