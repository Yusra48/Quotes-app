import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesItem.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageViewModel extends BaseViewModel {
  List<QuoteData> _quoteItems = [];
  List<QuoteData> get quoteItems => _quoteItems;

  ImageViewModel() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteImages = prefs.getStringList('favorite_images') ?? [];

    final imagePaths = [
      'assets/Robert.jpg',
      'assets/mind.jpg',
      'assets/knowledge.jpg',
      'assets/Einstein.jpg',
      'assets/creativity.jpg',
      'assets/Believe.jpg',
      'assets/monday.png',
      'assets/you.png',
      'assets/years.png',
      'assets/reality.png',
      'assets/secret.png',
      'assets/pablo.png',
      'assets/perfection.png',
      'assets/lifes.png',
      'assets/focus.png',
      'assets/dreams.png',
      'assets/download.png',
      'assets/confidence.png',
      'assets/Comeback.png',
      'assets/butterfly.png'
    ];

    _quoteItems = List.generate(
      imagePaths.length,
      (index) => QuoteData(
        imagePath: imagePaths[index],
        isFavorite: favoriteImages.contains(imagePaths[index]),
      ),
    );
    notifyListeners();
  }

  Future<void> toggleFavorite(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final item = _quoteItems[index];
    item.isFavorite = !item.isFavorite;

    List<String> favoriteImages = prefs.getStringList('favorite_images') ?? [];
    if (item.isFavorite) {
      favoriteImages.add(item.imagePath);
    } else {
      favoriteImages.remove(item.imagePath);
    }

    prefs.setStringList('favorite_images', favoriteImages);
    notifyListeners();
  }

  void shareImage(String imagePath) {
    Fluttertoast.showToast(
      msg: "Sharing ${imagePath}...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
