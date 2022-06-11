import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  String email = "";
  String name = "";
  String phoneNumber = "";

  Person(this.name, this.email, this.phoneNumber);
}

class PersonList with ChangeNotifier {
  List<Person> contactAry = [];
  void addToList(Person contact) {
    contactAry.add(contact);
    FirebaseFirestore.instance
        .collection('users')
        .add({
          "userId": contact.name,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    notifyListeners();
  }

  List<Person> get contactList {
    return contactAry;
  }
}
