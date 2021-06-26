import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/services/quotes.dart';
import 'quote_page.dart';
import 'bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({this.quotes});
  final Quotes quotes;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _quotePages.add(QuotePage(quote: widget.quotes.getNextQuote()));
    _quotePages.add(QuotePage(quote: widget.quotes.getNextQuote()));
  }

  List<QuotePage> _quotePages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PageView(
            children: _quotePages,
            onPageChanged: (pageid) {
              if (pageid == _quotePages.length - 1) {
                _quotePages.add(QuotePage(quote: widget.quotes.getNextQuote()));
              }
              setState(() {});
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: BottomBar(),
      ),
    );
  }
}
