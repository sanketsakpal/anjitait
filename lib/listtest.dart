import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/apimodel.dart';
import 'package:http/http.dart' as http;

class Anjitalist extends StatefulWidget {
  const Anjitalist({Key? key}) : super(key: key);

  @override
  _AnjitalistState createState() => _AnjitalistState();
}

class _AnjitalistState extends State<Anjitalist> {
  var response = {};
  Example? resp1;
  bool isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // apicall();
    setState(() {
      isloading = true;
    });
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Container(
              child: ListView.separated(
                // itemCount: resp1?.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${resp1?.data?[index].name}"),
                    subtitle: Text("${resp1?.data?[index].email}"),
                    trailing: Text("${resp1?.data?[index].status}"),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                  );
                },
                itemCount: resp1!.data!.length,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  apicall() async {
    var resp = await http.get(Uri.parse(
      "https://gorest.co.in/public-api/users",
    ));
    setState(() {
      Map<String, dynamic> response = jsonDecode(resp.body);
      resp1 = Example.fromJson(response);
    });
    // print(resp.body);
    // print(resp1!.data![1].id);
  }
}
