import 'package:flutter_application_1/Ui/Models/Dialogquotes.dart';
import 'package:stacked/stacked.dart';


class DialogQuoteViewModel extends BaseViewModel {
  List<Dialogquotes> _quotes = [];
  List<Dialogquotes> get quotes => _quotes;

  void addQuote(String quote, String imageNetwork) {
    _quotes.add(
      Dialogquotes(
        quote: quote,
        imageNetwork: imageNetwork,
      ),
    );
    notifyListeners();
  }
}
