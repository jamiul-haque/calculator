// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 17, 0),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnumber;
  late int secondnumber;
  String display = "";
  late String res;
  late String operator;
  void btnClick(String btnval) {
    if (btnval == "C") {
      display = "";
      firstnumber = 0;
      secondnumber = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "X" ||
        btnval == "/") {
      firstnumber = int.parse(display);
      res = "";
      operator = btnval;
    } else if (btnval == "=") {
      secondnumber = int.parse(display);
      if (operator == "+") {
        res = (firstnumber + secondnumber).toString();
      }
      if (operator == "-") {
        res = (firstnumber - secondnumber).toString();
      }
      if (operator == "X") {
        res = (firstnumber * secondnumber).toString();
      }
      if (operator == "/") {
        res = (firstnumber ~/ secondnumber).toString();
      }
    } else {
      res = int.parse(display + btnval).toString();
    }
    setState(() {
      display = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () {
       btnClick(btnval);
      },
      child: Text(
        "$btnval",
        style: TextStyle(
            fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w600),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$display",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 43, 41, 41),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     custombutton("C"),
            //     custombutton("()"),
            //     custombutton("%"),
            //     custombutton("/"),
            //   ],
            // ),
            Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("/"),
              ],
            ),
            Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("X"),
              ],
            ),
            Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
