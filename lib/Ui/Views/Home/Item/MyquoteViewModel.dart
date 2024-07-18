import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class MyQuotesViewModel extends BaseViewModel {
  List<Map<String, String>> _quotes = [];
  List<Map<String, String>> get quotes => _quotes;

  Future<void> loadQuotes() async {
    setBusy(true);
    final prefs = await SharedPreferences.getInstance();
    final quotesJson = prefs.getString('quotes') ?? '[]';
    _quotes = List<Map<String, String>>.from(json.decode(quotesJson));
    setBusy(false);
    notifyListeners();
  }

  Future<void> addQuote(String quote, String colorHex) async {
    setBusy(true);
    _quotes.add({'quote': quote, 'color': colorHex});
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quotes', json.encode(_quotes));
    setBusy(false);
    notifyListeners();
  }

  Color generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
