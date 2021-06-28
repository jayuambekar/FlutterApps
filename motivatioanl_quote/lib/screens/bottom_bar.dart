import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivatioanl_quote/screens/quote_page.dart';
import 'package:share/share.dart';

class BottomBar extends StatelessWidget {
  BottomBar({@required this.currentQuotePage});
  final QuotePage currentQuotePage;
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
            onPressed: () {
              final copiedData = ClipboardData(
                text:
                    '"${currentQuotePage.quote.quote}" - ${currentQuotePage.quote.author}',
              );
              final snackBarContent = SnackBar(
                content: Text(
                  "Copied to Clipboard",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              );
              //currentQuotePage.of(context).showSnakBar(snackBarContent);
              Clipboard.setData(copiedData);
            },
          ),
          /*IconButton(
              tooltip: 'favorite quote',
              icon: Icon(
                Icons.favorite_border_sharp,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
              final snackBarContent = SnackBar(
                content: Text(
                  "Added to favorites",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              );
              },),*/
          IconButton(
              tooltip: 'share quote',
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                print("shared");
                Share.share(
                    '${currentQuotePage.quote.quote} -- ${currentQuotePage.quote.author}');
              }),
        ],
      ),
    );
  }
}
