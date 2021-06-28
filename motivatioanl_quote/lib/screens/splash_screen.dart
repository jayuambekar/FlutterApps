import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/screens/home_page.dart';
import 'package:motivatioanl_quote/services/quotes.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimarySplashScreen extends StatefulWidget {
  @override
  _PrimarySplashScreenState createState() => _PrimarySplashScreenState();
}

class _PrimarySplashScreenState extends State<PrimarySplashScreen> {
  Quotes quotes = Quotes();

  Future<Widget> loadHomePage() async {
    //await Future.delayed(Duration(minutes: 5));
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
      imageBackground: AssetImage('images/quoteback.jpg'),

      image: Image.asset(
        'images/quote.png',
        width: 900,
        height: 900,
      ),

      title: Text(
        " Get Inspired ",
        style: GoogleFonts.jomolhari(
          textStyle: TextStyle(
              fontSize: 45, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      navigateAfterFuture: loadHomePage(),
      //seconds: 5,
      //navigateAfterSeconds: LoadingScreen(),
    );
  }
}
