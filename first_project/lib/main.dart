import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Center(
            child: Text('Welcome..Home !!'),
          ),
          backgroundColor: Colors.cyan[800],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/myhouse.jpg'),
          ),
        ),
      ),
    ),
  );
}
