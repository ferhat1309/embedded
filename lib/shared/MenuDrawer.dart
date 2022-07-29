import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/InductanceCalculator.dart';
import 'package:flutter_application_1/screens/LedCalculator.dart';
import 'package:flutter_application_1/screens/ResistorCalculator.dart';
import '../screens/CapacitorCalculator.dart';
import '../screens/Embedded.dart';
import '../screens/EmbeddedWhat.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context),),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home Embedded',
      'What is Embedded System',
      'Resistor Calculator',
      'Capacitor Calculator',
      'Inductance Calculator',
      'Led Calculator'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.green),
      child: Text(
        'Embedded Guide',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ));
    menuTitles.forEach((String element) {
      Widget screens = Container();
      menuItems.add(ListTile(
        title: Text(element, style: TextStyle(fontSize: 15)),
        onTap: () {
          switch (element) {
            case 'Home Embedded':
              screens = EmbeddedScreen();
              break;
            case 'What is Embedded System':
             screens = EmbeddedWhatScreen();
             break;
            case 'Resistor Calculator':
             screens = ResistarCalculator();
            break;
            case 'Capacitor Calculator':
             screens = CapacitorCalculator();
            break;
            case 'Inductance Calculator':
             screens = InductanceCalculator();
            break;
            case 'Led Calculator':
             screens = LedCalculator();
            break;
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screens)
          );
        },
      ));
    });
    return menuItems;
  }
}
