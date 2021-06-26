import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future loadSomeData() async {
    await Future.delayed(Duration(seconds: 5), () {
      print("Data Loaded");
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    loadSomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCircle(
                  color: Colors.red,
                  size: 80,
                ),
                Text(
                  'Loading data',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
