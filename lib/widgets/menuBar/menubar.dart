import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuBar extends StatefulWidget {
  const menuBar({Key? key}) : super(key: key);
  static const routeName = '/menuBar';

  @override
  State<StatefulWidget> createState() => menuBarState();
}

class menuBarState extends State<menuBar> {
  var seleectedIndex = 0;
  static const List<Widget> widgetOption = <Widget>[
    Text('index 0'),
    Text('index 1'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bottomBar();
  }

  Widget bottomBar() {
    return Scaffold(
      appBar: AppBar(title: Text('hello')),
      body: widgetOption.elementAt(seleectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: seleectedIndex,
        onTap: _itemOnTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }

  void _itemOnTapped(int index) {
    setState(() {
      seleectedIndex = index;
    });
  }
}
