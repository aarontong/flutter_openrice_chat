import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'contact_form.dart';
import 'package:flutter_openrice_chat/model/person.dart';
import 'package:provider/provider.dart';
import 'contact_list.dart';

class addcontact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => printStatement(context),
                  child: Text('Add Contact'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: contactList(),
        ));
  }

  void printStatement(BuildContext ctx) {
    Navigator.pushNamed(ctx, contactForm.routeName);
  }
}
