import 'package:flutter/material.dart';
import 'package:shop_app/screens/forgot/components/body.dart';

class ForgotScreen extends StatelessWidget {
  static String routeName = "/forgot";
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Body(),
    );
  }
}
