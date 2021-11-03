import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";


  buttonPressed(String buttonText){
  if(buttonText == "CLEAR")
    {
      _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    }
  else if(buttonText == "+" || buttonText == "-" ||buttonText=="/"|| buttonText == "*")
    {
      num1 = double.parse(output);
      print(num1);
      operand = buttonText;

      _output = "0";
    }
  else if(buttonText == ".") {
    if(_output.contains(".")){
      print("Already contains a decimal");
      return;
    }
    else{
      _output = _output + buttonText;
    }
  }
  else if(buttonText == "=")
  {
    num2 = double.parse(output);
    if (operand == "+") {
      _output = (num1 + num2).toString();
    }
    else if (operand == "-") {
      _output = (num1 - num2).toString();
    }
    else if (operand == "*") {
      _output = (num1 * num2).toString();
    }
    else if (operand == "/") {
      _output = (num1 / num2).toString();
    }

    num1 = 0;
    num2 = 0;
    operand="";
  }
  else{
    _output += buttonText;
    }
  // print(_output);
  setState((){
    output=double.parse(_output).toStringAsFixed(2);
    }

  );

  }


  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0),
              // ignore: prefer_const_constructors
              child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: <Widget>[
              Row(children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("/")
              ]),
              Row(children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ]),
              Row(children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("-"),
              ]),
              Row(children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              Row(
                children: <Widget>[
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
