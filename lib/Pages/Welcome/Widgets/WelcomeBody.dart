import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:shimmer/shimmer.dart";

import "../../../Config/Images.dart";
import "../../../Config/Strings.dart";

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.boyPic),
            SvgPicture.asset(AssetsImage.connectSVG),
            Image.asset(AssetsImage.girlPic),
          ],
        ),

        const SizedBox(height: 30,),

        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.secondary,
          highlightColor: Colors.grey[300]!,
          child: Text(
            WelcomePageString.connected,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          WelcomePageString.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

