import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivatioanl_quote/services/quotes.dart';

class QuotePage extends StatelessWidget {
  QuotePage({@required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back1.jpg'),
          fit: BoxFit.cover,

        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '"${quote.quote}"',
              textAlign: TextAlign.center,
              style: GoogleFonts.courgette(
                textStyle: TextStyle(
                  fontSize: 35,
                  color: Colors.pink,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "- ${quote.author}",
              style: GoogleFonts.cookie(
                textStyle: TextStyle(
                  fontSize: 35,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
