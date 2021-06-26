import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              onPressed: () {}),
          IconButton(
              tooltip: 'favorite quote',
              icon: Icon(
                Icons.favorite_border_sharp,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {}),
          IconButton(
              tooltip: 'share quote',
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {}),
        ],
      ),
    );
  }
}
