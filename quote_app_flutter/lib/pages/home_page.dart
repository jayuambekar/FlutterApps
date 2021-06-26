import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "This is my quote which can occupy multiple lines hence I need to take care of the font style and other problems associated with it",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Playball',
                    fontSize: 30.0),
              ),
              SizedBox(height: 50,),
              Text(
                "- Author Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Pacifico-Regular',
                    fontSize: 25.0),
              ),
            ],
          ),
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
                icon: Icon(
                  Icons.content_copy,
                  color: Colors.white,
                ),
                iconSize: 40,
                color: Colors.white,
                //onPressed: ()
              ),
              IconButton(
                tooltip: 'favorite quote',
                icon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.white,
                ),
                iconSize: 40.0,
                //onPressed: ()
              ),
              IconButton(
                tooltip: 'share quote',
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                iconSize: 40.0,
                //onPressed: ()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
