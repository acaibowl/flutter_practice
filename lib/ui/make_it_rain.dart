import 'package:flutter/material.dart';

// セクション15

class MakeItRain extends StatefulWidget {
  @override
  _MakeItRainState createState() => _MakeItRainState();
}

class _MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;
  Color _moneyColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Make It Rain"),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    "Get Rich!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "\$ $_moneyCounter",
                  style: TextStyle(
                    color: _moneyColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 40.0,
                  ),
                ),
              )),
              Expanded(
                child: Center(
                  child: FlatButton(
                    color: Colors.lightGreen,
                    textColor: Colors.white70,
                    onPressed: _onPressedRainButton,
                    child: Text(
                      "Let It Rain!",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedRainButton() {
    setState(() {
      _moneyCounter = _moneyCounter + 1100;
      if (_moneyCounter > 10000) {
        _moneyColor = Colors.redAccent;
      }
    });
  }
}
