import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _pages = <Widget>[
    new Center(child: new Text("0", style: new TextStyle(fontSize: 60.0))),
    new Center(child: new Text("1", style: new TextStyle(fontSize: 60.0))),
    new Center(child: new Text("2", style: new TextStyle(fontSize: 60.0)))
  ];

  int _upperCount = 2;
  Widget getNewPage(String text) {
    print("Adding New Page: " + text);
    return new Center(
      child: new Text(
        text,
        style: new TextStyle(fontSize: 60.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        child: PageView(
          children: _pages,
          onPageChanged: (page_id) {
            if (page_id == _pages.length - 1) {
              _upperCount = _upperCount + 1;
              _pages.add(getNewPage(_upperCount.toString()));
              setState(() {});
            }
          },
          controller: PageController(initialPage: 0),
        ),
      ),
    );
  }
}

