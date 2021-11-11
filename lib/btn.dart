import 'package:flutter/material.dart';
import 'package:flutter_application_anjita_it/apicalltest.dart';
import 'package:flutter_application_anjita_it/listtest.dart';
import 'package:flutter_application_anjita_it/uitest.dart';

class Btn extends StatefulWidget {
  const Btn({Key? key}) : super(key: key);

  @override
  _BtnState createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Anjita()));
                },
                child: Text("add user")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => Anjitalist()));
                },
                child: Text("Listview")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Kidsui()));
                },
                child: Text("Ui")),
          ],
        ),
      ),
    );
  }
}
