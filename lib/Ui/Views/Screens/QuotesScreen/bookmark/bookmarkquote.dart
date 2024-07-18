import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesData.dart';
import 'package:flutter_application_1/Ui/Views/Screens/QuotesScreen/QuotesViewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class Bookmarkquote extends StatelessWidget {
  const Bookmarkquote({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteViewModel>.reactive(
      viewModelBuilder: () => QuoteViewModel(),
      builder: (context, model, child) {
        final bookmarkedQuotes = model.quoteItems.where((item) => item.isBookmarked).toList();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Bookmarked Quotes',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemCount: bookmarkedQuotes.length,
              itemBuilder: (BuildContext context, int index) {
                final quoteItem = bookmarkedQuotes[index];
                return _buildQuoteItem(context, quoteItem);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuoteItem(BuildContext context, QuoteItem quoteItem) {
    return Container(
      height: 290,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: quoteItem.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome_motion, size: 30, color: Colors.white),
            SizedBox(height: 10),
            Text(
              quoteItem.quote,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
