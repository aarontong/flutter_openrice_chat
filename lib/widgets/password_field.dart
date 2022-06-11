import 'package:flutter/material.dart';

class passwordField extends StatelessWidget {
  TextEditingController usernamelTitleController = TextEditingController();
  TextEditingController passwordController;
  FocusNode f3;

  final String? Function(String?)? validator;

  passwordField(
      {required this.validator,
      required this.passwordController,
      required this.f3});
  @override
  Widget build(BuildContext context) {
    usernamelTitleController.text = "Password:";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Flexible(
          child: TextField(
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            controller: usernamelTitleController,
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              //      contentPadding: EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
        new Flexible(
          child: TextFormField(
            validator: validator,
            textAlignVertical: TextAlignVertical.bottom,
            keyboardType: TextInputType.emailAddress,
            controller: passwordController,
            focusNode: f3,
          ),
        )
      ],
    );
  }
}
