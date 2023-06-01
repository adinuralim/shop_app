import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        Image.asset("assets/images/success.png"),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Login Success",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(
                      text: "Back to home",
                      press: () {
                        Navigator.pop(context, LoginSuccessScreen.routeName);
                      })),
            ],
          ),
        ),
        Spacer()
      ],
    );
  }
}
