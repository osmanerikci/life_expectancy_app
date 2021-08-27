import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InputPage(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.lightBlueAccent,
        ));
  }
}
