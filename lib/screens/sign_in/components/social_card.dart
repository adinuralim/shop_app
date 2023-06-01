import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoialCard extends StatelessWidget {
  final String icon;
  final Function press;
  const ScoialCard({super.key, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {press()},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(10),
          height: 40,
          width: 40,
          child: SvgPicture.asset(icon),
          decoration:
              BoxDecoration(color: Color(0xFFF5F6f9), shape: BoxShape.circle),
        ));
  }
}
