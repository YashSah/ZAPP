import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/ImagePicker.dart';

import '../../../Config/Images.dart';
import '../../../Model/UserModel.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;

  const TypeMessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
              color: Colors.white,
              width: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                message.value = value;
              },
              controller: messageController,
              decoration: const InputDecoration(
                filled: false,
                hintText: "Text Message",
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => chatController.selectedImagePath.value == ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      chatController.selectedImagePath.value =
                          await imagePickerController.pickImage();
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          AssetsImage.chatGallerySvg,
                          width: 25,
                        )),
                  )
                : SizedBox(),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(() => message.value != "" ||
                  chatController.selectedImagePath.value != ""
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (messageController.text.isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
                      chatController.sendMessage(
                          userModel.id!, messageController.text, userModel);
                      messageController.clear();
                    }
                  },
                  child: Container(
                      width: 30,
                      height: 30,
                      child: chatController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(
                        AssetsImage.chatSendSvg,
                        width: 25,
                      ),
                  ),
                )
              : Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    AssetsImage.chatMicSvg,
                    width: 25,
                  ),
                )),
        ],
      ),
    );
  }
}
