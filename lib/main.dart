import 'package:flutter/material.dart';
import 'package:flutter_openrice_chat/widgets/login.dart';
import 'widgets/contact_form.dart';
import 'widgets/addcontact.dart';
import 'model/person.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PersonList(),
        ),
      ],
      child: MyStatefulWidget(),
    ),
  );
}

class MyAppState extends State<MyStatefulWidget> {
  var seleectedIndex = 0;
  static const Widget lw = loginWidget();
  static const List<Widget> widgetOption = <Widget>[
    Text('index 0'),
    Text('index 1'),
    lw
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        ),
      ),
      home: bottomBar(),
      routes: {
        contactForm.routeName: (ctx) => contactForm(),
      },
    );
  }

  void _itemOnTapped(int index) {
    setState(() {
      seleectedIndex = index;
    });
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
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyAppState();
}
