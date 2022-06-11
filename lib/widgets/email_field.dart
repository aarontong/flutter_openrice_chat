import 'package:flutter/material.dart';

class emailField extends StatelessWidget {
  TextEditingController emailTitleController = TextEditingController();
  TextEditingController emailController;
  FocusNode f3;

  final String? Function(String?)? validator;

  emailField(
      {required this.validator,
      required this.emailController,
      required this.f3});
  @override
  Widget build(BuildContext context) {
    emailTitleController.text = "Email:";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Flexible(
          child: TextField(
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            controller: emailTitleController,
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
            controller: emailController,
            focusNode: f3,
          ),
        )
      ],
    );
  }
}
