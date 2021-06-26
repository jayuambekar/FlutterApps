import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

import 'package:motivatioanl_quote/old/Quote.dart';
import 'package:motivatioanl_quote/old/database_helper.dart';

class QuoteData extends StatefulWidget {
  @override
  _QuoteDataState createState() => _QuoteDataState();
}

// call the API and fetch the response
Future<Quote> fetchQuote() async {
  var url = Uri.https('favqs.com', '/api/qotd');
  print(url);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  //final response = await http.get('https://favqs.com/api/qotd');
  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Quote');
  }
}

class _QuoteDataState extends State<QuoteData>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<Quote> quote;
  var dbHelper;
  Future<List<Quote>> wholeQuotes;
  @override
  void initState() {
    super.initState();
    quote = fetchQuote();
    dbHelper = DataBaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<Quote>(
      future: quote,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    snapshot.data.quoteText,
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.black,
                        fontFamily: 'quoteScript'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '-${snapshot.data.quoteAuthor}-',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.red[900],
                      fontFamily: 'quoteScript'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.blue[900],
                      ),
                      onPressed: () {
                        Share.share(
                            '${snapshot.data.quoteText}--${snapshot.data.quoteAuthor}');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.blue[900],
                      ),
                      onPressed: () {
                        Quote q = Quote(
                            quoteId: null,
                            quoteText: snapshot.data.quoteText,
                            quoteAuthor: snapshot.data.quoteAuthor);
                        dbHelper.saveQuote(q);
                        final snackBar = SnackBar(
                          backgroundColor: Colors.blue[100],
                          content: Text(
                            'Added to favorites',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                          ),
                        );
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
