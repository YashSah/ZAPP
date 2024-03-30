import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zapp/Config/Images.dart';
import 'package:zapp/Controller/AuthController.dart';
import 'package:zapp/Controller/ImagePicker.dart';
import 'package:zapp/Controller/ProfileController.dart';
import 'package:zapp/Widget/PrimaryButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = true.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name = TextEditingController(text: profileController.currentUser.value.name);
    TextEditingController email = TextEditingController(text: profileController.currentUser.value.email);
    TextEditingController phone = TextEditingController(text: profileController.currentUser.value.phoneNumber);
    TextEditingController about = TextEditingController(text: profileController.currentUser.value.about);

    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    RxString imagePath = "".obs;

    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              // height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isEdit.value ?  SizedBox(
                              height: 160,
                              width: 160,
                              child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context).colorScheme.background,
                                    ),
                                    child: profileController.currentUser.value.profileImage == null || profileController.currentUser.value.profileImage == ""
                                        ? Icon(Icons.image)
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                        child: CachedNetworkImage(
                                          imageUrl: profileController.currentUser.value.profileImage!,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: -25,
                                    child: RawMaterialButton(
                                      onPressed: () async{
                                        imagePath.value = await imagePickerController.pickImage(ImageSource.gallery);

                                        print("Image Picked Successfully!" + imagePath.value);
                                      },
                                      elevation: 2.0,
                                      fillColor: Theme.of(context).colorScheme.secondary,
                                      child: SvgPicture.asset(AssetsImage.chatGallerySvg, color: Colors.white,),
                                      padding: EdgeInsets.all(13),
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ): CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              radius: 80,
                              child: Icon(Icons.image),
                            ),
                          ],
                        ),),
                        
                        SizedBox(height: 20,),
                        Obx(() => TextFormField(
                          controller: name,
                          enabled: isEdit.value,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Name",
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                        ),),
                        SizedBox(height: 10,),
                        Obx(() => TextFormField(
                          maxLines: null,
                          controller: about,
                          enabled: isEdit.value,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "About",
                            prefixIcon: Icon(
                              Icons.info,
                            ),
                          ),
                        ),),
                        TextFormField(
                          maxLines: null,
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.alternate_email,
                            ),
                          ),
                        ),
                        Obx(() => TextFormField(
                          controller: phone,
                          enabled: isEdit.value,
                          decoration: InputDecoration(
                            filled: isEdit.value,
                            labelText: "Phone Number",
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                        ),),
                        
                        SizedBox(height: 20,),
                        
                        Obx(() => isEdit.value ? PrimaryButton(
                          btnName: "Save",
                          icon: Icons.save,
                          ontap: () async{
                            await profileController.updateProfile(imagePath.value, name.text, about.text, phone.text);
                            isEdit.value = false;
                          },
                        ) : PrimaryButton(
                          btnName: "Edit",
                          icon: Icons.edit,
                          ontap: (){
                            isEdit.value = true;
                          },
                        ),),

                        SizedBox(height: 20,),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
