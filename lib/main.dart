import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations ([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var sx = Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          print ('tap');
          FocusScope.of(context).requestFocus (FocusNode());
        },
        child: HomePage()
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

class HomePage extends StatelessWidget {
  TextEditingController inputCtrl = TextEditingController ();

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;


    var vs1 = TextFormField (
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

    var vs2 = Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container (
            child: Text ('v1.1.2')
        ),
        Container (
            child: vs1
        )
      ],
    );

    var vs = Stack (
      children: [
        AnimatedPositioned(
          top: keyboardHeight * -1,
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          duration: Duration(milliseconds: 250),
          child: vs2,
        )
      ],
    );

    return Container (
        padding: EdgeInsets.all(20),
        child: vs
    );
  }
}