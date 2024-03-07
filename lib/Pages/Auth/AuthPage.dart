import 'package:flutter/material.dart';
import 'package:zapp/Pages/Auth/Widgets/AuthPageBody.dart';
import 'package:zapp/Pages/Welcome/Widgets/WelcomeHeading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                WelcomeHeading(),
                SizedBox(height: 40,),
                AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
