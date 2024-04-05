import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/ChatController.dart';
import '../Controller/ImagePicker.dart';

Future<dynamic> ImagePickerBottomSheet(BuildContext context, RxString imagePath, ImagePickerController imagePickerController) {
  return Get.bottomSheet(Container(
    height: 150,
    decoration: BoxDecoration(
        color:
        Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () async{
            imagePath.value =
            await imagePickerController.pickImage(ImageSource.camera);
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
              Theme.of(context).colorScheme.background,
            ),
            child: Icon(
              Icons.camera,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () async{
            imagePath.value =
            await imagePickerController.pickImage(ImageSource.gallery);
            Get.back();
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
              Theme.of(context).colorScheme.background,
            ),
            child: Icon(
              Icons.photo_library_rounded,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
              Theme.of(context).colorScheme.background,
            ),
            child: Icon(
              Icons.video_camera_back_outlined,
              size: 30,
            ),
          ),
        ),
      ],
    ),
  ));
}