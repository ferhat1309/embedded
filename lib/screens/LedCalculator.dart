import 'package:flutter/material.dart';

class LedCalculator extends StatefulWidget {
  const LedCalculator({Key? key}) : super(key: key);

  @override
  State<LedCalculator> createState() => _LedCalculatorState();
}

class _LedCalculatorState extends State<LedCalculator> {
  final TextEditingController txtSourceVoltage = TextEditingController();
  final TextEditingController txtLedCurrent = TextEditingController();
  final TextEditingController txtLedVoltage = TextEditingController();
  final TextEditingController txtLedofNumber = TextEditingController();

  final double fontSize = 5;

  bool isOLOR = true;
  bool isTLOR = false;
  bool isPLOR = false;
  late List<bool> isSelected;
  String image = 'assets/ldh-led.jpg';

  void initState() {
    isSelected = [isOLOR, isTLOR, isPLOR];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Led Calculator'),
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ToggleButtons(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Led\nResistor-Series',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Three Led\nResistor-Series',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Parallel\nLed Resistor',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
                isSelected: isSelected,
                onPressed: ToggleLedCase,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: txtSourceVoltage,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter Source Voltage'),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: txtLedVoltage,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter One of Led Voltage'),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: txtLedCurrent,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter One of Led Current'),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              enabled: isPLOR,
              controller: txtLedofNumber,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: 'Please Enter Led of Number'),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: fontSize),
              ),
              onPressed: () {
                calculated(); 
              }),
        )
      ]),
    );
  }

  void ToggleLedCase(value) {
    if (value == 0) {
      isOLOR = true;
      isTLOR = false;
      isPLOR = false;
      image = 'assets/ldh-led.jpg';
    } else if (value == 1) {
      isOLOR = false;
      isTLOR = true;
      isPLOR = false;
      image = 'assets/slh-led.jpg';
    } else {
      isOLOR = false;
      isTLOR = false;
      isPLOR = true;

      image = 'assets/pblh-led.jpg';
    }
    setState(() {
      isSelected = [isOLOR, isTLOR, isPLOR];
    });
  }
  void calculated(){
    double Source = double.tryParse(txtSourceVoltage.text) ?? 0;
    double Voltage = double.tryParse(txtLedVoltage.text) ?? 0;
    double Current = double.tryParse(txtLedCurrent.text) ?? 0;
    double LedofNumber = double.tryParse(txtLedofNumber.text) ?? 0;
    double  Resistor = 0;
    String message = '';

    if (isOLOR == true) {
      Resistor = (Source-Voltage)/(Current);
    } 
    else if(isTLOR == true) {
      Resistor = (Source-(Voltage*3))/(Current);
    }
    else if(isPLOR == true){
      Resistor = (Source-Voltage)/(Current*LedofNumber);
    }
    
    message = Resistor.toString() + ' Ohm';



    if (Resistor <= 0) {
      message = 'please increase the voltage of the voltage source or decrease the voltage of the leds';
    }


    openDialog(message);

  }

  Future openDialog(String message) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Result'),
          content: Text(message),
          actions: [
            TextButton(child: Text('Exit'),onPressed: Exit)
          ],
        ),
      );

  void Exit(){
    Navigator.of(context).pop();
  }
}
