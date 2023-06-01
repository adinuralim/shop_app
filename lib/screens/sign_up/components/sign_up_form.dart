import 'package:flutter/material.dart';
import 'package:shop_app/components/custome_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password, confirmPassword;
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
              height: 30,
            ),
            buildConfirmPassowrdFormField(),
            const SizedBox(
              height: 20,
            ),
            FormError(
              errors: errors,
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                })
          ],
        ));
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        onSaved: (newValue) {
          email = newValue;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            removeError(error: kEmailNullError);
            _formKey.currentState!.validate();
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            removeError(error: kInvalidEmailError);
            _formKey.currentState!.validate();
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            addError(error: kEmailNullError);
            return "";
          } else if (value.isNotEmpty &&
              !emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            addError(error: kInvalidEmailError);
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
            removeError(error: kPassNullError);
            _formKey.currentState!.validate();
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            removeError(error: kShortPassError);
            _formKey.currentState!.validate();
          }
          setState(() {
            password = value;
          });
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            addError(error: kPassNullError);
            return "";
          } else if (value.isNotEmpty &&
              value.length < 8 &&
              !errors.contains(kShortPassError)) {
            addError(error: kShortPassError);
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

  TextFormField buildConfirmPassowrdFormField() {
    return TextFormField(
        onSaved: (newValue) => confirmPassword = newValue,
        onChanged: (value) {
          if (value == password) {
            removeError(error: kMatchPassError);
            _formKey.currentState!.validate();
          }
        },
        validator: (value) {
          if (password != value) {
            addError(error: kMatchPassError);
            return "";
          }
          return null;
        },
        obscureText: true,
        decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            hintText: "Enter your confirm password",
            labelText: "Confirm Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomeSuffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )));
  }
}
