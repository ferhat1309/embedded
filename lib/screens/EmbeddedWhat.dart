import 'package:flutter/material.dart';

final String Embedded =
        "Embedded system is a electronic of subbranch.Its core mandatesolves problemes supports with electronic and software.It consists of two parts." +
        "These are parts Hardware and Software designer.Hardware designer work on electronic componentes and these PCB design.As for software designer work on software design and develop required algorithm." +
        "Embedded systems are used in many areas from motor drivers to EKG devices in the industry.";

final List<String> WhereUse = [
  "Defens Indistry",
  "Medical",
  "Automotive",
  "Aeronautics and Space",
  "Telecommunication"
];
final List<String> NeedToKnow = [
  "C/C++ Language",
  "RTOS Operation System",
  "Communication Protocols",
  "PCB Designer Program",
  "Basic Electronics Knowledge",
  "Git vs. Knowledge",
  "Embedded Lunix"
];

class EmbeddedWhatScreen extends StatelessWidget {
  const EmbeddedWhatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('What is Embedded System',
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/embeddedWhat.jpg'),
              fit: BoxFit.cover,
            )),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text('What is Embedded System',style: TextStyle(fontSize: 17)),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  ),
                Container(
                  margin: EdgeInsets.all(10) ,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  child: Text(Embedded),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  child: Text('Where are embedded systems used?',style: TextStyle(fontSize: 17)),),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  child:Text(WhereUse.reduce((value, element) => value + '\n' + element)),),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  child: Text('Things to know about embedded systems',style: TextStyle(fontSize: 17)),),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white60),
                  child:Text(NeedToKnow.reduce((value, element) => value + '\n' + element)),)

              ],
            )));
  }
}
