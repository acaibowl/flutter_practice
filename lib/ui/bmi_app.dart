import 'package:flutter/material.dart';

// セクション18~19

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI",
      home: BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double bmi = 0.0;
  String resultString = "";

  void onCalculate() {
    setState(() {
      int age = int.parse(_ageController.text);
      double heightInches = double.parse(_heightController.text) * 12;
      double weight = double.parse(_weightController.text);

      if (age.toString().isEmpty &&
          age <= 0 &&
          heightInches.toString().isEmpty &&
          heightInches <= 0 &&
          weight.toString().isEmpty &&
          weight <= 0) {
        return;
      }

      bmi = weight / (heightInches * heightInches) * 703;

      if (bmi < 18.5) {
        resultString = "Underweight";
      } else if (18.5 < bmi && bmi < 24.9) {
        resultString = "Normal";
      } else if (25.0 < bmi && bmi < 29.9) {
        resultString = "Overweight";
      } else if (30.0 < bmi) {
        resultString = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.asset(
              "images/bmilogo.png",
              width: 200,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline),
                      labelText: "Age",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.assessment),
                      labelText: "Height in feet",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.line_weight),
                      labelText: "Weight in lb",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: onCalculate,
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    child: Text("Calculate"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Your BMI: ${bmi.toStringAsFixed(1)}",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
              child: Text(
                resultString,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
