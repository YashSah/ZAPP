import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zapp/Controller/ChatController.dart';
import 'package:zapp/Controller/GroupController.dart';
import 'package:zapp/Controller/ImagePicker.dart';

import '../../../Config/Images.dart';
import '../../../Model/UserModel.dart';
import '../../../Widget/ImagePickerBottomSheet.dart';
import '../../Model/GroupModel.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;

  const GroupTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    GroupController groupController = Get.put(GroupController());

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
            () => groupController.selectedImagePath.value == ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      ImagePickerBottomSheet(
                          context, groupController.selectedImagePath, imagePickerController);
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
                  groupController.selectedImagePath.value != ""
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    groupController.sendGroupMessage(
                        messageController.text, groupModel.id!, "");
                    messageController.clear();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: groupController.isLoading.value
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
