import 'package:flutter/material.dart';

class phoneNumberField extends StatelessWidget {
  TextEditingController phoneTitleController = TextEditingController();
  TextEditingController phoneController;
  FocusNode f2, f3;

  final String? Function(String?)? validator;

  phoneNumberField(
      {required this.validator,
      required this.phoneController,
      required this.f2,
      required this.f3});

  @override
  Widget build(BuildContext context) {
    phoneTitleController.text = "Phone Number:";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Flexible(
          child: TextField(
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            controller: phoneTitleController,
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              //     contentPadding: EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
        new Flexible(
          child: TextFormField(
            validator: validator,
            textAlignVertical: TextAlignVertical.bottom,
            keyboardType: TextInputType.phone,
            controller: phoneController,
            focusNode: f2,
            onFieldSubmitted: (term) {
              f2.unfocus();
              FocusScope.of(context).requestFocus(f3);
            },
          ),
        )
      ],
    );
  }
}
