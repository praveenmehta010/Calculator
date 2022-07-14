import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var problem = "0";
  var resultSize = 35.0;
  var problemSize = 55.0;
  var symbol = "";
  var result = "0";

  myCalculation(String btext) {
    setState(() {
      if (btext == "C") {
        problem = "0";
        result = "0";
      } else if (btext == "=") {
        resultSize = 55;
        problemSize = 35;
        try {
          var problemExpression = problem;
          problemExpression = problemExpression.replaceAll("x", "*");
          problemExpression = problemExpression.replaceAll("÷", "/");

          Parser problemString = Parser();
          Expression expression = problemString.parse(problemExpression);
          ContextModel contextModel = ContextModel();
          result = '${expression.evaluate(EvaluationType.REAL, contextModel)}';
          problem = "0";
        } catch (e) {
          result = "Error";
        }
      } else if (btext == "⌫") {
        problem = problem.substring(0, problem.length - 1);
        if (problem == "") {
          problem = "0";
        }
      } else if (btext == "sci") {
        result = "Not Working ':) ";
      } else {
        if (problem == "0") {
          problem = btext;
          if (problem == btext && result != "0") {
            result = "0";
            resultSize = 35;
            problemSize = 55;
          }
        } else {
          problem = problem + btext;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                result,
                style: TextStyle(fontSize: resultSize),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                problem,
                style: TextStyle(fontSize: problemSize),
              ),
            ),
            Expanded(child: Divider()),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        myButton("C", Colors.red),
                        myButton("⌫", Colors.red),
                        myButton("÷", Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("7", Colors.black87),
                        myButton("8", Colors.black87),
                        myButton("9", Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton("4", Colors.black87),
                        myButton("5", Colors.black87),
                        myButton("6", Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton("1", Colors.black87),
                        myButton("2", Colors.black87),
                        myButton("3", Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton(".", Colors.black87),
                        myButton("0", Colors.black87),
                        myButton("00", Colors.black87),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        myButton("x", Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("+", Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("-", Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("=", Colors.red),
                      ]),
                      TableRow(children: [
                        myButton("sci", Colors.red),
                        //
                      ]),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  myButton(var btext, Color bcolor) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.all(2),
      // padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.10,
      child: ElevatedButton(
          style:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(bcolor)),
          onPressed: () => myCalculation(btext),
          child: Text(
            btext,
            style: TextStyle(fontSize: 40),
          )),
    );
  }
}
