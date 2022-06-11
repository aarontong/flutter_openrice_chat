import 'package:flutter/material.dart';
import 'package:flutter_openrice_chat/model/person.dart';
import 'package:provider/provider.dart';
import 'contact_name.dart';
import 'phone_number_field.dart';
import 'email_field.dart';
import 'submit_button.dart';

// ignore: camel_case_types
class contactForm extends StatelessWidget {
  var personList;
  static const routeName = '/contactForm';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();

  // ignore: prefer_typing_uninitialized_variables
  late Size screenSize;
  // ignore: use_key_in_widget_constructors
  final _formKey = GlobalKey<FormState>();
  String? customValidtaor(String? fieldContent) {
    if (isEmailValid(fieldContent!)) {
      return null;
    } else {
      return 'Email Invalid.';
    }
    ;
  }

  String? nameValidtaor(String? fieldContent) {
    if (isNameValid(fieldContent!)) {
      return null;
    } else {
      return 'Name Invalid.';
    }
    ;
  }

  String? phoneValidator(String? fieldContent) {
    if (isPhoneNumberValid(fieldContent!)) {
      return null;
    } else {
      return 'Phone Numberr Invalid.';
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = 'your initial text';

    screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('hello')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Container(
                child: Form(
              child: Column(
                children: [
                  contactName(
                    validator: nameValidtaor,
                    nameController: nameController,
                    f1: f1,
                    f2: f2,
                  ),
                  phoneNumberField(
                    validator: phoneValidator,
                    phoneController: phoneController,
                    f2: f2,
                    f3: f3,
                  ),
                  emailField(
                    validator: customValidtaor,
                    emailController: emailController,
                    f3: f3,
                  ),
                  submitButton(submitClicked: () => submitClicked(context))
                ],
              ),
              key: _formKey,
            ))));
  }

  void submitClicked(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //  Navigator.of(context).pop();
      personList = Provider.of<PersonList>(context, listen: false);
      var person = Person(
          nameController.text, emailController.text, phoneController.text);
      personList.addToList(person);
    } else {}
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

  bool isNameValid(String name) {
    bool nameValid = RegExp(r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(name);
    bool nonEmpty = name.length > 0;
    return (nameValid && nonEmpty);
  }

  bool isPhoneNumberValid(String phone) {
    bool phoneValid = double.tryParse(phone) != null;
    return phoneValid;
  }
}
