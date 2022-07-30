import 'package:flutter/material.dart';
import '../shared/MenuDrawer.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class EmbeddedScreen extends StatelessWidget {
  const EmbeddedScreen({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Embedded System'),
        ),
        drawer: MenuDrawer(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/embedded.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white60),
                child: Text(
                  'Hi\nYou are Welcome \nMy Embedded App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2,
                            color: Colors.grey)
                      ]),
                )),
          ),
        ),
      );
  }
}