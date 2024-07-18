import 'package:flutter/material.dart';

class QuoteItem {
  final String quote;
  final Color color;
  bool isBookmarked;

  QuoteItem({
    required this.quote,
    required this.color,
    this.isBookmarked = false,
  });
}
