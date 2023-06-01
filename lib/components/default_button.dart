import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 56,
        child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
            onPressed: () => press(),
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )));
  }
}
