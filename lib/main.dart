import 'package:flutter/material.dart';
import 'package:flutter_app/buttonui.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    );
  }
}

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

var userques = "";
var userans = "";
// var rs = userans  userques;

class _calculatorState extends State<calculator> {
  final List<String> buttons = [
    "C",
    "Del",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "00",
    "0",
    ".",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(10),
                // color: Colors.white,
                alignment: Alignment.bottomLeft,
                child: Text(
                  userans,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              )),
              Container(
                padding: EdgeInsets.all(20),
                // color: Colors.white,
                alignment: Alignment.bottomRight,
                child: Text(
                  userques,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              )
            ],
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userques = "";
                                userans = "";
                              });
                            },
                            buttontxt: buttons[index],
                            Color: colorequal(buttons[index])
                                ? Color.fromARGB(255, 55, 151, 58)
                                // : Color.fromRGBO(108, 108, 109, 100)
                                : Color.fromRGBO(240, 240, 240, 100),
                            txtcolor: isopertae(buttons[index])
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Colors.white,
                          );
                        } else if (index == 1) {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userques =
                                    userques.substring(0, userques.length - 1);
                              });
                            },
                            buttontxt: buttons[index],
                            Color: colorequal(buttons[index])
                                ? Color.fromARGB(255, 55, 151, 58)
                                : Color.fromRGBO(240, 240, 240, 100),
                            txtcolor: Color.fromARGB(255, 0, 0, 0),
                          );
                        } else if (index == buttons.length - 1) {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                isequal();
                              });
                            },
                            buttontxt: buttons[index],
                            Color: colorequal(buttons[index])
                                ? Color.fromARGB(255, 55, 151, 58)
                                : Color.fromARGB(255, 100, 97, 97),
                            txtcolor: isopertae(buttons[index])
                                ? Color.fromARGB(255, 255, 0, 0)
                                : Colors.white,
                          );
                        } else {
                          return Mybutton(
                            buttontapped: () {
                              setState(() {
                                userques += buttons[index];
                              });
                            },
                            buttontxt: buttons[index],
                            Color: colorequal(buttons[index])
                                ? Color.fromARGB(255, 55, 151, 58)
                                : Color.fromRGBO(108, 108, 109, 100),
                            txtcolor: isopertae(buttons[index])
                                ? Color.fromARGB(255, 55, 151, 58)
                                : Colors.white,
                          );
                        }
                      }),
                ),
              ))
        ],
      ),
    );
  }
}

bool isopertae(String x) {
  if (x == '%' ||
      x == 'C' ||
      x == '()' ||
      x == '/' ||
      x == 'x' ||
      x == '-' ||
      x == '+') {
    return true;
  } else {
    return false;
  }
}

bool colorequal(String y) {
  if (y == '=') {
    return true;
  } else {
    return false;
  }
}

void isequal() {
  String finalquest = userques;
  finalquest = finalquest.replaceAll("x", '*');
  finalquest = finalquest.replaceAll("+/-", '(-');
  Parser p = Parser();
  Expression exp = p.parse(finalquest);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  userans = eval.toString();
}
