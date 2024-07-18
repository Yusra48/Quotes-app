import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesData.dart';
import 'package:flutter_application_1/Ui/Views/Screens/QuotesScreen/QuotesViewmodel.dart';
import 'package:flutter_application_1/Ui/Views/Screens/QuotesScreen/bookmark/bookmarkquote.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class ViewQuotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteViewModel>.reactive(
      viewModelBuilder: () => QuoteViewModel(),
      builder: (context, model, child) {
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
              'Latest Quotes',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bookmarkquote(),
                      ),
                    );
                  },
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: model.quoteItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final quoteItem = model.quoteItems[index];
                  return _buildQuoteItem(context, quoteItem, index, model);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuoteItem(BuildContext context, QuoteItem quoteItem, int index, QuoteViewModel model) {
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
            SizedBox(height: 5),
            IconButton(
              icon: Icon(
                quoteItem.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: quoteItem.isBookmarked ? Colors.red : Colors.grey[800],
              ),
              onPressed: () {
                model.toggleBookmark(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
