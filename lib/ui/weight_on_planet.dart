import 'package:flutter/material.dart';

// セクション17

class WeightOnPlanetXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weight On Planet X",
      home: WeightOnPlanet(),
    );
  }
}

enum Planet { Pluto, Mars, Venus }

class WeightOnPlanet extends StatefulWidget {
  @override
  _WeightOnPlanetState createState() => _WeightOnPlanetState();
}

class _WeightOnPlanetState extends State<WeightOnPlanet> {
  final TextEditingController _weightController = TextEditingController();
  int _radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _finalResult = _calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
        case 1:
          _finalResult = _calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
        case 2:
          _finalResult = _calculateWeight(_weightController.text, 0.92);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
      }
    });
  }

  double _calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }

    // default
    return int.parse("180") * 0.38;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              "images/planet.png",
              width: 133.0,
              height: 200.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight on Earth",
                      hintText: "In Pounds",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.brown,
                      ),
                      Text(
                        "Pluto",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Padding(padding: const EdgeInsets.only(right: 20.0)),
                      Radio<int>(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.red,
                      ),
                      Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Padding(padding: const EdgeInsets.only(right: 20.0)),
                      Radio<int>(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.orange,
                      ),
                      Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Padding(padding: const EdgeInsets.only(right: 20.0)),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 20.0)),
                  Text(
                    _weightController.text.isEmpty
                        ? "Please enter weight"
                        : _formattedText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
