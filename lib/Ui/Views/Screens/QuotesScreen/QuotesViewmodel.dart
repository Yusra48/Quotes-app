import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesData.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteViewModel extends BaseViewModel {
  final List<String> _quotes = [
    "It is better to fail in originality than to succeed in imitation. —Herman Melville",
    "Either you run the day or the day runs you. —Jim Rohn",
    "Just when the caterpillar thought the world was ending, he turned into a butterfly.",
    "To know how much there is to know is the beginning of learning to live. —Dorothy West",
    "The only place where success comes before work is in the dictionary. — Vince Lombardi",
    "However difficult life may seem, there is always something you can do and succeed at. — Stephen Hawking",
    "The two most important days in your life are the day you are born and the day you find out why. – Mark Twain",
    "Too many of us are not living our dreams because we are living our fears. – Les Brown",
    "To bring about change, you must not be afraid to take the first step. We will fail when we fail to try. — Rosa Parks",
    "It is during our darkest moments that we must focus to see the light. — Aristotle",
    "Life is a succession of lessons which must be lived to be understood. — Helen Keller",
    "Life is not a problem to be solved, but a reality to be experienced. — Soren Kierkegaard",
    "Curiosity about life in all of its aspects I think, is still the secret of great creative people. — Leo Burnett",
    "The big lesson in life, baby, is never be scared of anyone or anything. — Frank Sinatra",
    "Money and success don’t change people; they merely amplify what is already there. — Will Smith",
    "The best way to predict the future is to create it. – Abraham Lincoln",
    "When you change your thoughts, remember to also change your world. — Norman Vincent",
    "The way to get started is to quit talking and begin doing. — Walt Disney",
    "To succeed in life, you need three things: a wishbone, a backbone, and a funny bone. — Reba McEntire",
    "The future belongs to those who believe in the beauty of their dreams. — Eleanor Roosevelt",
    "It is during our darkest moments that we must focus to see the light. — Aristotle",
    "Do not go where the path may lead; go instead where there is no path and leave a trail.",
    "You will face many defeats in life, but never let yourself be defeated. — Maya Angelou",
    "Never let the fear of striking out keep you from playing the game. — Babe Ruth",
    "Do not let making a living prevent you from making a life. — John Wooden",
    "So we beat on, boats against the current, borne back ceaselessly into the past."
  ];

  final List<Color> _colors = [
    Colors.blue[700]!,
    Colors.green[700]!,
    Colors.orange[700]!,
    Colors.purple[700]!,
    Colors.teal[700]!,
    Colors.red[700]!,
    Colors.deepOrange[700]!,
    Colors.deepPurple[900]!,
    Colors.indigo[700]!,
    Colors.amber[700]!,
    Colors.cyan[700]!,
    Colors.brown[700]!,
    Colors.blueGrey[700]!,
    Colors.lime[700]!,
    Colors.deepOrange[700]!,
    Colors.deepPurple[700]!,
    Colors.indigo[700]!,
    Colors.amber[700]!,
    Colors.cyan[700]!,
    Colors.brown[700]!,
    Colors.blueGrey[700]!,
    Colors.lime[700]!,
    Colors.deepOrange[700]!,
    Colors.deepPurple[700]!,
    Colors.indigo[700]!,
    Colors.amber[700]!,
  ];


  List<QuoteItem> _quoteItems = [];
  List<QuoteItem> get quoteItems => _quoteItems;

  QuoteViewModel() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedQuotes = prefs.getStringList('bookmarked_quotes') ?? [];
    
    _quoteItems = List.generate(
      _quotes.length,
      (index) => QuoteItem(
        quote: _quotes[index],
        color: _colors[index % _colors.length],
        isBookmarked: bookmarkedQuotes.contains(_quotes[index]),
      ),
    );
    notifyListeners();
  }

  Future<void> toggleBookmark(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final quote = _quoteItems[index];
    quote.isBookmarked = !quote.isBookmarked;

    List<String> bookmarkedQuotes = prefs.getStringList('bookmarked_quotes') ?? [];
    if (quote.isBookmarked) {
      if (!bookmarkedQuotes.contains(quote.quote)) {
        bookmarkedQuotes.add(quote.quote);
      }
    } else {
      bookmarkedQuotes.remove(quote.quote);
    }
    await prefs.setStringList('bookmarked_quotes', bookmarkedQuotes);

    notifyListeners();
  }
}
