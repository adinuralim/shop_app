import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomeSuffixIcon extends StatelessWidget {
  final String svgIcon;
  const CustomeSuffixIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
        child: SvgPicture.asset(
          svgIcon,
          height: 18,
        ));
  }
}
