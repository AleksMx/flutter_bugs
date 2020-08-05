import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController inputCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return getContent ();
  }

  Widget getContent () {
    var vs = TextFormField(
        maxLength: 15,
        controller: inputCtrl,
        keyboardType: TextInputType.phone,
        //validator: _validateDate,
        style: TextStyle (fontSize: 14),
        decoration: const InputDecoration (
            hintText: "000 000-00-00",
            counterText: "",
            labelText: "Input test"
        )
    );

    var sx = Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          //FocusScope.of(context).requestFocus (FocusNode());
        },
        child: Container (
          padding: EdgeInsets.all(20),
          child: vs
        )
      )
    );

    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData (
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: sx
    );
  }
}

