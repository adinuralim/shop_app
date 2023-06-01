import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("TOKOTO",
            style: TextStyle(
              fontSize: 36,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            )),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Image.asset(
          image,
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
