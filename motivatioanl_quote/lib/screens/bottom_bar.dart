import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:motivatioanl_quote/screens/quote_page.dart';
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';

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
                backgroundColor: Colors.grey[300],
                elevation: 10,
                duration: const Duration(seconds: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(right: 70.0, left: 70.0, bottom: 10.0),
                content: Text(
                  "Copied",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBarContent);
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
                //print("shared");
                Share.share(
                    '${currentQuotePage.quote.quote} -- ${currentQuotePage.quote.author}');
              }),
        ],
      ),
    );
  }
}
