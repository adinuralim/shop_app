import 'package:flutter/material.dart';
import 'package:shop_app/components/custome_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/components/no_account_text.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your email and we will send \nyou a link to return to your account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                  ),
                  ForgotPasswordForm(),
                ],
              ))),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildForgotFormField(),
            SizedBox(
              height: 30,
            ),
            FormError(errors: errors),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO
                  }
                }),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            NoAccountText(),
          ],
        ));
  }

  TextFormField buildForgotFormField() {
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
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(
              () {
                errors.remove(kInvalidEmailError);
              },
            );
          }

          if (!errors.contains(kEmailNullError) &&
              !errors.contains(kInvalidEmailError)) {
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
          } else if (!emailValidatorRegExp.hasMatch(value) &&
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
}
