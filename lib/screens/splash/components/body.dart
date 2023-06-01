import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop, \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                        onPageChanged: (value) => {
                              setState(() {
                                currentPage = value;
                              })
                            },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                            text: splashData[index]["text"]!,
                            image: splashData[index]["image"]!))),
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(splashData.length,
                                  (index) => buildDot(index: index)),
                            ),
                            Spacer(),
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: DefaultButton(
                                  text: "Continue",
                                  press: () {
                                    Navigator.pushNamed(
                                        context, SignInScreen.routeName);
                                  },
                                )),
                          ],
                        )))
              ],
            )));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 18 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
