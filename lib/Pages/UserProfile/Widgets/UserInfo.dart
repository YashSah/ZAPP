import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Config/Images.dart';
import '../../../Controller/ProfileController.dart';

class LoginUserInfo extends StatelessWidget {
  const LoginUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(20),
      // height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsImage.boyPic,),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Flexible(
                      child: Text(
                        profileController.currentUser.value.name! ?? "User",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        profileController.currentUser.value.email!,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.background
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.phone,color: Colors.green,),
                          SizedBox(width: 10,),
                          Text(
                            "Call",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.background
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.videocam_rounded, color: Color(0xffFF9900),),
                          SizedBox(width: 10,),
                          Text(
                            "Video",
                            style: TextStyle(
                              color: Color(0xffFF9900),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.background
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetsImage.appIconSVG, width: 25,),
                          SizedBox(width: 10,),
                          Text(
                            "Chat",
                            style: TextStyle(
                              color: Color(0xff0057FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
