import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      backgroundColor: Colors.teal[500],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/jayu.jpg'),
            ),
            Text(
              'Jayshree Ambekar',
              style: TextStyle(
                fontFamily: 'Charm',
                fontSize: 40.0,
                letterSpacing: 1.2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'SOFTWARE DEVELOPER',
              style: TextStyle(
                fontFamily: 'FiraSans',
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.green.shade900,
                ),
                title: Text(
                  '+91 9021586636',
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontFamily: 'FiraSans',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.green.shade900,
                ),
                title: Text(
                  'jayu.ambekar@gmail.com',
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontFamily: 'FiraSans',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
