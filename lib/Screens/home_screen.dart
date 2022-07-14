import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget myButton(var btext, var bheight, Color bcolor) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.all(2),
      // padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.10 * bheight,
      child: ElevatedButton(
          style:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(bcolor)),
          onPressed: () {},
          child: Text(
            btext,
            style: TextStyle(fontSize: 40),
          )),
    );
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
                '0',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '0',
                style: TextStyle(fontSize: 30),
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
                        myButton("C", 1, Colors.red),
                        myButton("⌫", 1, Colors.redAccent),
                        myButton("÷", 1, Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("7", 1, Colors.black87),
                        myButton("8", 1, Colors.black87),
                        myButton("9", 1, Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton("6", 1, Colors.black87),
                        myButton("5", 1, Colors.black87),
                        myButton("4", 1, Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton("3", 1, Colors.black87),
                        myButton("2", 1, Colors.black87),
                        myButton("1", 1, Colors.black87),
                      ]),
                      TableRow(children: [
                        myButton(".", 1, Colors.black87),
                        myButton("0", 1, Colors.black87),
                        myButton("00", 1, Colors.black87),
                      ])
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(children: [
                        myButton("x", 1, Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("+", 1, Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("-", 1, Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("%", 1, Colors.indigoAccent),
                      ]),
                      TableRow(children: [
                        myButton("=", 1, Colors.red),
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
}
