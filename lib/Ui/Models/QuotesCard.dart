import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuoteCard extends StatelessWidget {
  final String quote;
  final Color backgroundColor;

  QuoteCard({required this.quote, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quote,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Align(alignment: Alignment.bottomRight),
           IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () { },
          ),
        ],
      ),
    );
  }
}
