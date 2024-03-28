import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zapp/Config/Images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isReceived;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble({super.key, required this.message, required this.isReceived, required this.time, required this.status, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
              minWidth: 100,
              maxWidth: MediaQuery.of(context).size.width / 1.3,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: isReceived ? BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
              ) : BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: imageUrl == ""
                ? Text(message)
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child:  CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                ),
                message == "" ? Container() : SizedBox(height: 10,),
                message == "" ? Container() : Text(message),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isReceived ? Text(
                time,
                style: Theme.of(context).textTheme.labelMedium,
              ) : Row(
                children: [
                  Text(time, style: Theme.of(context).textTheme.labelMedium,),
                  SvgPicture.asset(AssetsImage.chatStatusSvg, width: 20,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
