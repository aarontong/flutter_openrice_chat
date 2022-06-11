import 'package:flutter/material.dart';

class usernameField extends StatelessWidget {
  TextEditingController usernamelTitleController = TextEditingController();
  TextEditingController usernameController;
  FocusNode f3;

  final String? Function(String?)? validator;

  usernameField(
      {required this.validator,
      required this.usernameController,
      required this.f3});
  @override
  Widget build(BuildContext context) {
    usernamelTitleController.text = "User Name:";
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
            controller: usernameController,
            focusNode: f3,
          ),
        )
      ],
    );
  }
}
