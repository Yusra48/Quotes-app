import 'package:flutter/foundation.dart';

class QuoteItem {
  final String imagePath;
  bool isFavorite;

  QuoteItem({required this.imagePath, this.isFavorite = false});
}

class QuotesViewModel extends ChangeNotifier {
  List<QuoteItem> _quoteItems = [
    QuoteItem(imagePath: 'assets/Images/why.png'),
    QuoteItem(imagePath: 'assets/Images/valuetime.png'),
    QuoteItem(imagePath: 'assets/Images/true.png'),
    QuoteItem(imagePath: 'assets/Images/self love.png'),
    QuoteItem(imagePath: 'assets/Images/marry.png'),
    QuoteItem(imagePath: 'assets/Images/love.png'),
    QuoteItem(imagePath: 'assets/Images/life.png'),
    QuoteItem(imagePath: 'assets/Images/images.png'),
    QuoteItem(imagePath: 'assets/Images/health.png'),
    QuoteItem(imagePath: 'assets/Images/dream.png'),
    QuoteItem(imagePath: 'assets/Images/Beyourself.png'),
    QuoteItem(imagePath: 'assets/Images/act.png'),
    QuoteItem(imagePath: 'assets/butterfly.png'),
    QuoteItem(imagePath: 'assets/Comeback.png'),
    QuoteItem(imagePath: 'assets/confidence.png'),
    QuoteItem(imagePath: 'assets/download.png'),
    QuoteItem(imagePath: 'assets/dreams.png'),
    QuoteItem(imagePath: 'assets/focus.png'),
    QuoteItem(imagePath: 'assets/lifes.png'),
    QuoteItem(imagePath: 'assets/perfection.png'),
    QuoteItem(imagePath: 'assets/you.png'),
  ];

  List<QuoteItem> get quoteItems => _quoteItems;

  void toggleFavorite(int index) {
    _quoteItems[index].isFavorite = !_quoteItems[index].isFavorite;
    notifyListeners();
  }

  void shareImage(String imagePath) {
    print('Sharing image: $imagePath');
  }
}
