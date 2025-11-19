import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late double size;
  String res = "";
  String displaytxt = "";
  String temp = "";
  String op = "";


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 6;


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                displaytxt,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calc("7", Colors.grey),
                    calc("8", Colors.grey),
                    calc("9", Colors.grey),
                    calc("/", Colors.yellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calc("4", Colors.grey),
                    calc("5", Colors.grey),
                    calc("6", Colors.grey),
                    calc("*", Colors.yellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calc("1", Colors.grey),
                    calc("2", Colors.grey),
                    calc("3", Colors.grey),
                    calc("-", Colors.yellow),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calc("0", Colors.grey),
                    calc(".", Colors.grey),
                    calc("=", Colors.yellow),
                    calc("+", Colors.yellow),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: calc("Clear", Colors.black),
                )
              ]
            )
          ],
        )
      ),
    );
  }
  Widget calc(String txt,Color bgcolor) {
    return InkWell(
      onTap: () {
        setState(() {
          if (txt == "Clear") {
            displaytxt = "";
            temp = "";
            op = "";
            return;
          }

          // Operator pressed
          if (txt == "+" || txt == "-" || txt == "*" || txt == "/") {
            // If there is already a pending operator and the user has entered
            // a second operand, compute the pending operation first (chaining).
            if (op.isNotEmpty && displaytxt.isNotEmpty && temp.isNotEmpty) {
              double? a = double.tryParse(temp);
              double? b = double.tryParse(displaytxt);
              if (a != null && b != null) {
                double r;
                if (op == "+") {
                  r = a + b;
                } else if (op == "-") {
                  r = a - b;
                } else if (op == "*") {
                  r = a * b;
                } else {
                  r = a / b;
                }
                temp = formatResult(r);
              } else {
                // Fallback: keep the current display as temp if parsing fails
                temp = displaytxt;
              }
            } else {
              // No pending operation: store current value as first operand
              temp = displaytxt;
            }
            op = txt;
            displaytxt = "";
            return;
          } else if (txt != "=") {
            // Prevent multiple decimal points
            if (txt == "." && displaytxt.contains('.')) return;
            displaytxt += txt;
            return;
          }

          // Equals pressed
          if (txt == "=") {
            if (op.isEmpty || temp.isEmpty || displaytxt.isEmpty) return;
            double? a = double.tryParse(temp);
            double? b = double.tryParse(displaytxt);
            if (a == null || b == null) return;
            double result;
            if (op == "+") {
              result = a + b;
            } else if (op == "-") {
              result = a - b;
            } else if (op == "*") {
              result = a * b;
            } else {
              result = a / b;
            }
            displaytxt = formatResult(result);
            op = "";
            temp = "";
          }
        });
      },


      child: Container(
        height: size,
        width: size,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
    );
  }

  String formatResult(double v) {
    if (v == v.roundToDouble()) return v.toInt().toString();
    String s = v.toStringAsFixed(8);
    s = s.replaceFirst(RegExp(r'0+$'), '');
    s = s.replaceFirst(RegExp(r'\.$'), '');
    // If the previous replaceFirst didn't remove trailing zeros correctly,
    // fall back to a simpler trim of trailing zeros.
    s = s.replaceFirst(RegExp(r'0+$'), '');
    s = s.replaceFirst(RegExp(r'\.$'), '');
    return s;
  }
}

