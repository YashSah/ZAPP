import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../Config/Images.dart';
import '../../../Config/Strings.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        Get.offAllNamed("/authPage");
      },
      innerColor: Theme.of(context).colorScheme.secondary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
      sliderButtonIcon: SvgPicture.asset(
        AssetsImage.connectSVG,
        width: 25,
      ),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
  }
}
