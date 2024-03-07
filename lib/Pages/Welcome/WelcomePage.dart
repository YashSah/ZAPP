import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:zapp/Pages/Welcome/Widgets/WelcomeBody.dart';
import 'package:zapp/Pages/Welcome/Widgets/WelcomeFooterButton.dart';
import 'package:zapp/Pages/Welcome/Widgets/WelcomeHeading.dart';

import '../../Config/Images.dart';
import '../../Config/Strings.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WelcomeHeading(),
              WelcomeBody(),
              WelcomeFooterButton(),
            ],
          ),
        ),
      )
    );
  }
}
