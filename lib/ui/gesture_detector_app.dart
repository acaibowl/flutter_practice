import 'package:flutter/material.dart';

// セクション14

class GestureDetectorApp extends StatelessWidget {
  @required
  final String title;

  const GestureDetectorApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange.shade400,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade400,
          title: Text(title),
        ),
        body: Center(
          child: CustomButton(),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Hello gestures."),
            backgroundColor: Colors.yellowAccent,
            duration: Duration(seconds: 10),
            action: SnackBarAction(
              label: "Hay",
              onPressed: () => debugPrint("snackbar action."),
            ),
          ),
        );
      },
      onDoubleTap: () => debugPrint("double tap"),
      child: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(18.0)),
        child: Text("First button"),
      ),
    );
  }
}
