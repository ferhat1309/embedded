import 'dart:core';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class InductanceCalculator extends StatefulWidget {
  const InductanceCalculator({Key? key}) : super(key: key);

  @override
  State<InductanceCalculator> createState() => _InductanceCalculatorState();
}

class _InductanceCalculatorState extends State<InductanceCalculator> {
  final double fontSize = 18;
  final TextEditingController txtNumberofInd = TextEditingController();
  List<TextEditingController> _controller = [];
  bool isSerial = true;
  bool isParallel = false;
  int listCount = 0;
  double result = 0;

  String image = 'assets/Ind-series.jpg';
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isSerial, isParallel];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inductance Calculator'),
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Series',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Parallel',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: ToggleCase,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: txtNumberofInd,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter Number of Inductance'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text(
                    'Ok',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onPressed: () {
                    listCount = (int.tryParse(txtNumberofInd.text))!;
                    for (int i = 0; i <= listCount; i++)
                      _controller.add(TextEditingController());
                    setState(() {});
                  }),
              SizedBox(width: 20,),
              ElevatedButton(
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onPressed: () {
                    calculated(); //setState(() {});
                  }),
            ],
          ),
        ),
        Expanded(
          flex: int.tryParse(txtNumberofInd.text) != null ? 6 : 5,
          child: ListView.builder(
            itemCount: listCount,
            itemBuilder: (BuildContext context, int index) {
              return TextField(
                controller: _controller[index],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '${index + 1} Inductance'),
              );
            },
          ),
        ),
      ]),
    );
  }

  void ToggleCase(value) {
    if (value == 0) {
      isParallel = false;
      isSerial = true;
      image = 'assets/Ind-series.jpg';
    } else {
      isParallel = true;
      isSerial = false;
      image = 'assets/Ind-parallel.jpg';
    }
    setState(() {
      isSelected = [isSerial, isParallel];
    });
  }

  void calculated() {
    List<double> valuesInd = [];
    double sum = 0;
    for (int i = 0; i < listCount; i++) {
      valuesInd.add(double.tryParse(_controller[i].text)!);
    }
    if (isSerial == true) {
      for (int i = 0; i < listCount; i++) {
        sum = sum + valuesInd[i];
      }
    } else {
      for (int i = 0; i < listCount; i++) {
        sum = (sum + (1 / valuesInd[i]));
      }
      sum = 1 / sum;
    }

    openDialog(sum);
  }

  Future openDialog(double sum) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Result'),
          content: Text('$sum' + ' Henrry'),
          actions: [
            TextButton(child: Text('Exit'),onPressed: Exit)
          ],
        ),
      );

  void Exit(){
    Navigator.of(context).pop();
  }
}
