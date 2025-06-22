import 'package:flutter/material.dart';
import '../controllers/converter_controller.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  ConverterController controller = ConverterController();
  TextEditingController kmController = TextEditingController();
  TextEditingController mileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Distance Converter', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: kmController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 24),
                decoration: InputDecoration(
                  labelText: 'Kilometers',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    mileController.text = controller.convertKmToMile(value);
                  });
                },
              ),
            ),

            Icon(Icons.swap_vert, color: Colors.orange, size: 40),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextField(
                controller: mileController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 24),
                decoration: InputDecoration(
                  labelText: 'Miles',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    kmController.text = controller.convertMileToKm(value);
                  });
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  kmController.clear();
                  mileController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Clear',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}