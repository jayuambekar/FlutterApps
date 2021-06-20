import 'package:flutter/material.dart';

import 'package:motivatioanl_quote/quote_data.dart';
import 'package:motivatioanl_quote/favorite_quotes.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: HomePage(),
        ),
      ),
    );

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
                'images/background2.jpg',
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
