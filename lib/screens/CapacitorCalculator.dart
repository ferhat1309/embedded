import 'dart:core';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class CapacitorCalculator extends StatefulWidget {
  const CapacitorCalculator({Key? key}) : super(key: key);

  @override
  State<CapacitorCalculator> createState() => _CapacitorCalculatorState();
}

class _CapacitorCalculatorState extends State<CapacitorCalculator> {
  final double fontSize = 18;
  final TextEditingController txtNumberofCap = TextEditingController();
  List<TextEditingController> _controller = [];
  //String result = '';
  bool isSerial = true;
  bool isParallel = false;
  int listCount = 0;
  double result = 0;

  String image = 'assets/cap-series.jpg';
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
        title: Text('Capacitor Calculator'),
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
              controller: txtNumberofCap,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter Number Capacitor'),
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
                    listCount = (int.tryParse(txtNumberofCap.text))!;
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
          flex: int.tryParse(txtNumberofCap.text) != null ? 6 : 5,
          child: ListView.builder(
            itemCount: listCount,
            itemBuilder: (BuildContext context, int index) {
              return TextField(
                controller: _controller[index],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '${index + 1} Capacitor'),
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
      image = 'assets/cap-series.jpg';
    } else {
      isParallel = true;
      isSerial = false;
      image = 'assets/cap-parallel.jpg';
    }
    setState(() {
      isSelected = [isSerial, isParallel];
    });
  }

  void calculated() {
    List<double> valuesCap = [];
    double sum = 0;
    for (int i = 0; i < listCount; i++) {
      valuesCap.add(double.tryParse(_controller[i].text)!);
    }
    if (isSerial == false) {
      for (int i = 0; i < listCount; i++) {
        sum = sum + valuesCap[i];
      }
    } else {
      for (int i = 0; i < listCount; i++) {
        sum = (sum + (1 / valuesCap[i]));
      }
      sum = 1 / sum;
    }

    openDialog(sum);
  }

  Future openDialog(double sum) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Result'),
          content: Text('$sum' + ' Farad'),
          actions: [
            TextButton(child: Text('Exit'),onPressed: Exit)
          ],
        ),
      );

  void Exit(){
    Navigator.of(context).pop();
  }
}
