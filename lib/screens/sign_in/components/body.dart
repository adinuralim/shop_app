import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/custome_suffix_icon.dart';
import 'package:shop_app/screens/sign_in/components/no_account_text.dart';
import 'package:shop_app/screens/sign_in/components/sign_form.dart';
import 'package:shop_app/screens/sign_in/components/social_card.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                SignForm(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScoialCard(
                        icon: "assets/icons/facebook-2.svg", press: () {}),
                    ScoialCard(
                        icon: "assets/icons/google-icon.svg", press: () {}),
                    ScoialCard(icon: "assets/icons/twitter.svg", press: () {}),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                NoAccountText()
              ]))),
    );
  }
}
