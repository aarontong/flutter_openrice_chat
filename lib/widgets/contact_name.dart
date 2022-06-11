import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class contactName extends StatelessWidget {
  TextEditingController nameTitleController = TextEditingController();
  TextEditingController nameController;
  FocusNode f1;
  FocusNode f2;

  final String? Function(String?)? validator;

  contactName(
      {required this.validator,
      required this.nameController,
      required this.f1,
      required this.f2});
  @override
  Widget build(BuildContext context) {
    nameTitleController.text = "Customer Name:";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Flexible(
          child: TextField(
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            controller: nameTitleController,
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              //    contentPadding: EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
        new Flexible(
          child: TextFormField(
            validator: validator,
            textAlignVertical: TextAlignVertical.bottom,
            keyboardType: TextInputType.text,
            controller: nameController,
            focusNode: f1,
            onFieldSubmitted: (term) {
              f1.unfocus();
              FocusScope.of(context).requestFocus(f2);
            },
          ),
        )
      ],
    );
  }
}
