import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _buffer = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  bool _decimalAdded = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _buffer = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
        _decimalAdded = false;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _buffer = '';
        _decimalAdded = false;
      } else if (buttonText == '.') {
        if (!_decimalAdded) {
          _buffer = _buffer + buttonText;
          _output = _buffer;
          _decimalAdded = true;
        }
      } else if (buttonText == '=') {
        _num2 = double.parse(_buffer);
        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == '×') {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == '÷') {
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = 'ERROR';
          }
        }
        _buffer = '';
        _operand = '';
        _num1 = 0;
        _num2 = 0;
        _decimalAdded = false;
      } else {
        _buffer = _buffer + buttonText;
        _output = _buffer;
      }
    });
  }

  Widget _buildButton(String buttonText,
      {Color? textColor, Color? buttonColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            primary: buttonColor ?? Colors.grey[300],
            onPrimary: textColor ?? Colors.black,
            padding: EdgeInsets.all(24.0),
            textStyle: TextStyle(fontSize: 20.0),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('÷', buttonColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('×', buttonColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-', buttonColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('C', buttonColor: Colors.redAccent),
                  _buildButton('0'),
                  _buildButton('.',
                      textColor: Colors.white, buttonColor: Colors.grey[700]),
                  _buildButton('+', buttonColor: Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('=',
                      textColor: Colors.white, buttonColor: Colors.blueAccent),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
