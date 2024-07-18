import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesCard.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_application_1/Ui/Views/Home/Item/MyquoteViewModel.dart';


class MyQuotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyQuotesViewModel>.reactive(
      viewModelBuilder: () => MyQuotesViewModel(),
      onModelReady: (model) => model.loadQuotes(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My Quotes',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  await _showAddQuoteDialog(context, model);
                },
              ),
            ],
          ),
          body: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : model.quotes.isEmpty
                  ? Center(child: Text('No quotes available.'))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: model.quotes.length,
                      itemBuilder: (context, index) {
                        final quoteData = model.quotes[index];
                        final quote = quoteData['quote'] ?? '';
                        final colorHex = quoteData['color'] ?? 'FFFFFF';
                        final backgroundColor =
                            Color(int.parse(colorHex, radix: 16) + 0xFF000000);

                        return QuoteCard(
                          quote: quote,
                          backgroundColor: backgroundColor,
                        );
                      },
                    ),
        );
      },
    );
  }

  Future<void> _showAddQuoteDialog(
      BuildContext context, MyQuotesViewModel model) async {
    final TextEditingController _quoteController = TextEditingController();
    Color _backgroundColor = model.generateRandomColor();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Create a Quote',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _quoteController,
                    decoration: InputDecoration(
                      hintText: 'Enter your quote here',
                      prefixIcon: Icon(Icons.paste, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: _backgroundColor,
                    height: 150,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        _quoteController.text.isEmpty
                            ? 'Quote Preview'
                            : _quoteController.text,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _backgroundColor = model.generateRandomColor();
                      });
                    },
                    child: Text(
                      'Change Background Color',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            TextButton(
              onPressed: () async {
                final quote = _quoteController.text;
                final colorHex = _backgroundColor.value
                    .toRadixString(16)
                    .padLeft(6, '0')
                    .toUpperCase();

                if (quote.isNotEmpty) {
                  await model.addQuote(quote, colorHex);
                  Navigator.of(context).pop();
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a quote.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
