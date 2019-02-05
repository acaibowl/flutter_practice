import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// セクション20

void main() async {
  List _data = await getJson();

  print(_data[0]['title']);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Json Parse"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _data.length,
          padding: const EdgeInsets.all(14.0),
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text(
                    "${_data[position]["title"]}",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text(
                    "${_data[position]["body"]}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "${_data[position]['body'][0]}".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  onTap: () =>
                      _showonTapMessage(context, _data[position]["body"]),
                )
              ],
            );
          },
        ),
      ),
    ),
  ));
}

void _showonTapMessage(BuildContext context, String message) {
  var alert = AlertDialog(
    title: Text("My App"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
