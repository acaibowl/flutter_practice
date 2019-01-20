import 'package:flutter/material.dart';

// セクション16

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = "Please input";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _showWelcome();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = "Welcome, $_userController.text";
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "images/face.png",
              width: 90.0,
              height: 90.0,
//              color: Colors.greenAccent,
            ),
            Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: "User name",
                      icon: Icon(Icons.person),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.redAccent,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                              onPressed: _erase,
                              color: Colors.redAccent,
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(14.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _welcomeString,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
