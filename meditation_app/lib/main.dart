import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/widgets.dart';
import 'package:meditation_app/focus_mode.dart';
import 'package:meditation_app/relaxation_mode.dart';
import 'package:meditation_app/meditation_mode.dart';
import 'package:meditation_app/sleep_mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Every Day is a New Beginning",
                          style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 25,
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            PromoIcons(assetName: "assets/images/moon.png"),
                            PromoIcons(assetName: "assets/images/circle.png"),
                            PromoIcons(assetName: "assets/images/triangle.png"),
                            PromoIcons(assetName: "assets/images/drop.png"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Let's focus on our self",
                                style: TextStyle(
                                  fontFamily: "Josefin",
                                  fontSize: 25,
                                ),
                              ),
                              Text("~~")
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                              background: Color(0xffffb773),
                              flexSize: 4,
                              mgTop: 30,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 10,
                              modeName: "Focus Mode",
                              assetImage: "assets/images/coltri.png",
                              buttonAsset: "assets/images/triangle.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => FocusMode())),
                            ),
                            Modes(
                              background: Color(0xffcf8cf9),
                              flexSize: 6,
                              mgTop: 10,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 30,
                              modeName: "Meditation\nMode",
                              assetImage: "assets/images/colmoon.png",
                              buttonAsset: "assets/images/moon.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => MeditationMode())),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                              background: Color(0xff74e9f8),
                              flexSize: 6,
                              mgTop: 30,
                              mgLeft: 10,
                              mgRight: 30,
                              mgBottom: 10,
                              modeName: "Relaxation\nMode",
                              assetImage: "assets/images/colcir.png",
                              buttonAsset: "assets/images/circle.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => RelaxationMode())),
                            ),
                            Modes(
                              background: Color(0xff97e37b),
                              flexSize: 4,
                              mgTop: 10,
                              mgLeft: 10,
                              mgRight: 30,
                              mgBottom: 30,
                              modeName: "Sleep Mode",
                              assetImage: "assets/images/coldrop.png",
                              buttonAsset: "assets/images/drop.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SleepMode())),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
