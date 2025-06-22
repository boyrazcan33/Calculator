import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import 'converter_screen.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorController controller = CalculatorController();
  String display = '0';

  void tap(String btn) {
    setState(() {
      display = controller.press(btn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Calculator', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.swap_horiz, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConverterScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  row(['C', '±', '%', '÷']),
                  row(['7', '8', '9', '×']),
                  row(['4', '5', '6', '-']),
                  row(['1', '2', '3', '+']),
                  lastRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget row(List<String> btns) {
    return Expanded(
      child: Row(
        children: btns.map((text) {
          Color bg = Colors.grey[800]!;
          if (text == 'C' || text == '±' || text == '%') bg = Colors.grey[600]!;
          if ('+-×÷'.contains(text)) bg = Colors.orange;

          return Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => tap(text),
                style: ElevatedButton.styleFrom(backgroundColor: bg, shape: CircleBorder()),
                child: Text(text, style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget lastRow() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => tap('0'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
                child: Text('0', style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => tap('.'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800], shape: CircleBorder()),
                child: Text('.', style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () => tap('='),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: CircleBorder()),
                child: Text('=', style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}