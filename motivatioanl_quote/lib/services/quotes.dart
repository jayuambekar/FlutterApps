import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as rootBundle;
import 'dart:math';
import 'package:motivatioanl_quote/utils/constants.dart';

class Quote {
  Quote({@required this.quote, @required this.author});
  String quote;
  String author;
}

class Quotes {
  List<Quote> _quotes = [];
  Random numberGenerator = Random();

  /*Future loadQuote() async {
    var url = Uri.https('api.quotable.io', '/random', {'maxLength': '200'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      _quotes.add(Quote(quote: data['content'], author: data['author']));
      //print("Added Quote: ${_quotes.length}");
    } else {
      throw Exception('Failed to load Quote');
    }
  }*/

  Future loadQuote() async {
    var response = await rootBundle.rootBundle.loadString('json/quotes.json');
    dynamic data = jsonDecode(response);
    for (dynamic quoteFromJson in data['results']) {
      String content = quoteFromJson['content'];
      if (content.length <= MAX_LENGTH_OF_QUOTE) {
        _quotes.add(Quote(
            quote: quoteFromJson['content'], author: quoteFromJson['author']));
      }
    }

    print("Total number of quotes loaded: ${_quotes.length}");
  }

  Quote getNextQuote() {
    int quoteIndex = numberGenerator.nextInt(_quotes.length - 1);
    return _quotes[quoteIndex];
  }
}
