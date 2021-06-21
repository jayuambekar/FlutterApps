import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data;
  var my_data;
  var c;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,//topRight,
                  end: Alignment.bottomRight,//bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.indigo[800],
                    Colors.indigo[700],
                    Colors.indigo[600],
                    Colors.indigo[400],
                  ],
                ),
              ),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/q.json'),
                builder: (context, snapshot) {
                  my_data = json.decode(snapshot.data.toString());
                  var range = new Random();
                  c = range.nextInt(my_data.length);
                  return Ui_Card();
                },
              ),
            ),
            Positioned(
                child: AppBar(
              title: Text(
                "*** Quotes ***",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontFamily: 'FugazOne-Regular',
                    fontSize: 50.0),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Container(
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                tooltip: 'Copy',
                icon: Icon(Icons.content_copy),
                iconSize: 40,
                color: Colors.white,
                onPressed: () async {
                  final data = ClipboardData(
                    text: my_data[c]['quoteText'] +
                        '\n' +
                        my_data[c]['quoteAuthor'],
                  );
                  Clipboard.setData(data);
                },
              ),
              IconButton(
                tooltip: 'favorite quote',
                icon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.white,
                ),
                iconSize: 40.0,
                onPressed: () {
                  Text(
                    'Added to favorites',
                    style: TextStyle(color: Colors.redAccent, fontSize: 15.0),
                  );
                },
              ),
              IconButton(
                tooltip: 'Random Quotes',
                icon: Icon(Icons.format_quote_sharp),
                iconSize: 40,
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    var range = new Random();
                    c = range.nextInt(my_data.length);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Ui_Card() {
    return new Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    top: 150.0, left: 30.0, right: 20.0, bottom: 20.0),
                child: Text(
                  my_data[c]['quoteText'],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 42.0,
                    color: Colors.white,
                    fontFamily: 'Cookie-Regular',
                    fontStyle: FontStyle.italic,
                  ),
                  textScaleFactor: 1.0,
                )),
            Text(
              my_data[c]['quoteAuthor'],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'DancingScript-VariableFont_wght',
                  fontSize: 30.0),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
