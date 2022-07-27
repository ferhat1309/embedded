import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Embedded.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: EmbeddedScreen(),
    );
  }
}
