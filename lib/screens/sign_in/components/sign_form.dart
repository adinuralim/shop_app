import 'package:flutter/material.dart';
import 'package:shop_app/components/custome_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/forgot/forgot_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            const SizedBox(
              height: 30,
            ),
            buildPassowrdFormField(),
            const SizedBox(
              height: 20,
            ),
            FormError(
              errors: errors,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                Text("Remember password"),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotScreen.routeName);
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                })
          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        onSaved: (newValue) {
          email = newValue;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(
              () {
                errors.remove(kEmailNullError);
              },
            );
            _formKey.currentState!.validate();
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(
              () {
                errors.remove(kInvalidEmailError);
              },
            );
            _formKey.currentState!.validate();
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            setState(
              () {
                errors.add(kEmailNullError);
              },
            );
            return "";
          } else if (value.isNotEmpty &&
              !emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(
              () {
                errors.add(kInvalidEmailError);
              },
            );
            return "";
          } else if (value.isEmpty) {
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            hintText: "Enter your email",
            labelText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomeSuffixIcon(
              svgIcon: "assets/icons/Mail.svg",
            )));
  }

  TextFormField buildPassowrdFormField() {
    return TextFormField(
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(
              () {
                errors.remove(kPassNullError);
              },
            );
            _formKey.currentState!.validate();
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            setState(
              () {
                errors.remove(kShortPassError);
              },
            );
            _formKey.currentState!.validate();
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(
              () {
                errors.add(kPassNullError);
              },
            );
            return "";
          } else if (value.isNotEmpty &&
              value.length < 8 &&
              !errors.contains(kShortPassError)) {
            setState(
              () {
                errors.add(kShortPassError);
              },
            );
            return "";
          } else if (value.isEmpty) {
            return "";
          }
          return null;
        },
        obscureText: true,
        decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            hintText: "Enter your password",
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomeSuffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )));
  }
}
