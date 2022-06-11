import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class submitButton extends StatelessWidget {
  final Function submitClicked;
  submitButton({required this.submitClicked});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
        onPressed: () => submitClicked(), child: Text('Submitted'));
  }
}
