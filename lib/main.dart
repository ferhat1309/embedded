import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Embedded System'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/embedded.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.white60),
                child: Text(
                  'Hi,You are Welcome My Embedded App',
                  style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),
                )),
          ),
        ),
      ),
    );
  }
}
