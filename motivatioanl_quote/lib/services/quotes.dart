import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quote {
  Quote({@required this.quote, @required this.author});
  String quote;
  String author;
}

class Quotes {
  List<Quote> _quotes = [];
  int quoteIndex = 0;
  Future loadQuote() async {
    var url = Uri.https('api.quotable.io', '/random');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      _quotes.add(Quote(quote: data['content'], author: data['author']));
      print("Added Quote: ${_quotes.length}");
    } else {
      throw Exception('Failed to load Quote');
    }
  }

  Quote getNextQuote() {
    Quote quote;
    print("Requested: $quoteIndex, Total: ${_quotes.length}");
    if (quoteIndex < _quotes.length) {
      quote = _quotes[quoteIndex];
      quoteIndex++;
    } else {
      //FIXME: If quote not available then wait for it
      quote = Quote(quote: "", author: "");
    }
    loadQuote();
    return quote;
  }
}
