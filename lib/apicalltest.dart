import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_anjita_it/model/apimodel.dart';
import 'package:http/http.dart' as http;

class Anjita extends StatefulWidget {
  const Anjita({Key? key}) : super(key: key);

  @override
  _AnjitaState createState() => _AnjitaState();
}

class _AnjitaState extends State<Anjita> {
  var response = {};
  Example? resp1;

  int val = 1;
  int _radioSelected = 1;
  late String _radioVal;
  String message = '';
  final emailController = TextEditingController();

  TextEditingController nam = TextEditingController();
  TextEditingController em = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // apicall();
  }

  void validateEmail(String enteredEmail) {
    if (EmailValidator.validate(enteredEmail)) {
      setState(() {
        message = 'Your email seems nice!';
      });
    } else {
      setState(() {
        message = 'Please enter a valid email address!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: nam,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: (enteredEmail) => validateEmail(enteredEmail),
          ),
        ),
        Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Male'),
            Radio(
              value: 1,
              groupValue: _radioSelected,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  Object? _radioSelected = value;
                  _radioVal = 'male';
                });
              },
            ),
            Text('Female'),
            Radio(
              value: 2,
              groupValue: _radioSelected,
              activeColor: Colors.pink,
              onChanged: (value) {
                setState(() {
                  Object? _radioSelected = value;
                  _radioVal = 'female';
                });
              },
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {
              apicall();
            },
            child: Text("submit"))
      ],
    ));
  }

  apicall() async {
    Map<String, dynamic> bodydata = {
      'name': nam.text,
      'email': em.text,
      'gender': val.toString()
    };
    var resp = await http.post(Uri.https("gorest.co.in/", 'public/v1/users'),
        body: bodydata);
    setState(() {
      var response = jsonDecode(resp.body);
      resp1 = Example.fromJson(response);
    });
    if (resp.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("welcome to anjita it solution"),
              content: Text("${resp1?.data?[2].id}"),
            );
          });
    } else {
      Text("wrong details");
    }
    print(resp.body);
    // print(resp1!.data![1].id);
  }
}
