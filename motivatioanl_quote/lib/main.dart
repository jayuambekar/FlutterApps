import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/screens/splash_screen.dart';

void main() => runApp(MotiVationalQuoteApp());

class MotiVationalQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimarySplashScreen(),
    );
  }
}
