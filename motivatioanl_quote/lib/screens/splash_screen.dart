import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/screens/home_page.dart';
import 'package:motivatioanl_quote/services/quotes.dart';
import 'package:splashscreen/splashscreen.dart';

class PrimarySplashScreen extends StatefulWidget {
  @override
  _PrimarySplashScreenState createState() => _PrimarySplashScreenState();
}

class _PrimarySplashScreenState extends State<PrimarySplashScreen> {
  Quotes quotes = Quotes();
  Future<Widget> loadPrimaryData() async {
    for (int i = 0; i < 2; i++) {
      await quotes.loadQuote();
    }
    return HomePage(
      quotes: quotes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'Primary Splash Screen',
        style: TextStyle(fontSize: 40),
      ),
      navigateAfterFuture: loadPrimaryData(),
      //seconds: 5,
      //navigateAfterSeconds: LoadingScreen(),
    );
  }
}
