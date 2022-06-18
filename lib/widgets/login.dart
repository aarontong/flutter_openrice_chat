import 'package:flutter/material.dart';
import 'package:flutter_openrice_chat/widgets/menuBar/menubar.dart';
import 'package:flutter_openrice_chat/widgets/username_field.dart';
import 'package:flutter_openrice_chat/widgets/password_field.dart';
import 'package:flutter_openrice_chat/widgets/submit_button.dart';

class loginWidget extends StatefulWidget {
  const loginWidget({Key? key}) : super(key: key);

  @override
  State<loginWidget> createState() => loginState();
}

class loginState extends State<loginWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameeTitleController = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameeTitleController.text = "User Name:";

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('hello')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: new Container(
          child: Form(
            child: Column(children: [
              usernameField(
                  validator: null,
                  usernameController: usernameController,
                  f3: f3),
              passwordField(
                validator: null,
                passwordController: passwordController,
                f3: f3,
              ),
              submitButton(submitClicked: () => submitClicked(context))
            ]),
            key: _formKey,
          ),
        ),
      ),
    );
  }

  void submitClicked(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(ctx, menuBar.routeName);
      /*
      personList = Provider.of<PersonList>(context, listen: false);
      var person = Person(
          nameController.text, emailController.text, phoneController.text);
      personList.addToList(person);
      */
    } else {}
  }
}
