import 'package:flutter/material.dart';
import 'package:flutter_openrice_chat/model/person.dart';
import 'package:provider/provider.dart';

class contactList extends StatelessWidget {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    final contact = Provider.of<PersonList>(context);

    return ListView.builder(
      itemBuilder: (ctx, i) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container(height: 50, color: Colors.red)),
            Expanded(child: Container(height: 50, color: Colors.yellow)),
          ]),
      itemCount: contact.contactAry.length,
    );
  }
}
