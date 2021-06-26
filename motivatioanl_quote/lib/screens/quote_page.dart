import 'package:flutter/material.dart';
import 'package:motivatioanl_quote/services/quotes.dart';

class QuotePage extends StatelessWidget {
  QuotePage({@required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quote.quote,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Playball',
                    fontSize: 30.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "- ${quote.author}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Pacifico-Regular',
                    fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
