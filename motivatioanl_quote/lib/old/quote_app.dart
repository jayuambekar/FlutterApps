import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/old/quote_data.dart';
import 'package:motivatioanl_quote/old/favorite_quotes.dart';
/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: size.width / 4,
        backgroundColor: Colors.white70,
        title: Text(
          'Daily Motivation',
          style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.bold,
              fontFamily: 'quoteScript',
              fontSize: 25.0),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Tooltip(
              message: 'Daily Quotes',
              child: Tab(
                icon: Icon(
                  Icons.today,
                ),
              ),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Stack(children: <Widget>[
            Center(
              child: Image.asset(
                'images/back1.jpg',
                width: size.width,
                height: size.height,
                fit: BoxFit.fill,
              ),
            ),
            QuoteData(),
          ]),
          FavoriteQuotes(),
        ],
      ),
    );
  }
}
*/
