import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

class DailyQuoteViewModel extends BaseViewModel {
  String dailyQuote = '';
  String dailyImageUrl = '';

  String get _dailyQuote => dailyQuote;
  String get _dailyImageUrl => dailyImageUrl;



Future<void> saveQuote(String quote, String colorHex) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? quotesJson = prefs.getStringList('my_quotes') ?? [];

  List<Map<String, String>> quotes = quotesJson.map((item) => jsonDecode(item) as Map<String, String>).toList();

  quotes.add({
    'quote': quote,
    'color': colorHex,
  });

  quotesJson = quotes.map((item) => jsonEncode(item)).toList();
  await prefs.setStringList('my_quotes', quotesJson);
}


  Future<List<String>> getQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('my_quotes') ?? [];
  }


  DailyQuoteViewModel() {
    _startDailyQuoteTimer();
  }

  void _updateDailyQuote() {
    DateTime now = DateTime.now();
    int dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;

    switch (dayOfYear % 31) { 
       case 0:
        dailyQuote =
            'Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill';
        dailyImageUrl =
            'https://images.pexels.com/photos/7130475/pexels-photo-7130475.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
        break;
         case 1:
        dailyQuote =
            "Your self-worth is determined by you. You don't have to depend on someone telling you who you are. — Beyoncé";
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/06/20/07/24/color-815551_640.png';
        break;
         case 2:
        dailyQuote =
            "To bring about change, you must not be afraid to take the first step. We will fail when we fail to try. — Rosa Parks";
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/07/11/18/28/gradient-841144_640.jpg';
        break;
         case 3:
        dailyQuote =
            "Champions keep playing until they get it right. — Billie Jean King";
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/04/18/17/26/artwork-7141119_640.png';
        break;
         case 4:
        dailyQuote =
            'It is during our darkest moments that we must focus to see the light. — Aristotle';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/08/13/17/59/background-1591226_640.jpg';
        break;
         case 5:
        dailyQuote =
            'Learn as if you will live forever, live like you will die tomorrow. —Mahatma Gandhi';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174065_640.png';
        break;
         case 6:
        dailyQuote =
            'When you change your thoughts, remember to also change your world. —Norman Vincent Peale';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/03/24/16/42/background-7089457_640.png';
        break;
         case 7:
        dailyQuote =
            'It is better to fail in originality than to succeed in imitation. —Herman Melville';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/06/03/17/53/blue-wallpaper-7240665_640.jpg';
        break;
         case 8:
        dailyQuote =
            'Develop success from failures. Discouragement and failure are two of the surest stepping stones to success. —Dale Carnegie';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/04/18/17/26/artwork-7141118_640.png';
        break;
         case 9:
        dailyQuote =
            'Success is getting what you want; happiness is wanting what you get. ―W. P. Kinsella';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174066_640.png';
        break;
         case 10:
        dailyQuote =
            'Experience is a hard teacher because she gives the test first, the lesson afterward.  ―Vernon Sanders Law';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/01/22/18/58/gradient-2000574_640.png';
        break;
         case 11:
        dailyQuote =
            'To know how much there is to know is the beginning of learning to live. —Dorothy West';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2023/01/01/18/34/abstract-7690589_640.jpg';
        break;
         case 12:
        dailyQuote =
            'When we strive to become better than we are, everything around us becomes better too. —Paulo Coelho';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2014/12/01/20/14/spectrum-553216_640.jpg';
        break;
         case 13:
        dailyQuote =
            'Setting goals is the first step in turning the invisible into the visible.  —Tony Robbins';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/05/04/20/03/purple-wallpaper-752886_640.jpg';
        break;
         case 14:
        dailyQuote =
            'Opportunity is missed by most people because it is dressed in overalls and looks like work.  —Thomas Edison';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/05/19/11/56/color-2326315_640.jpg';
        break;
         case 15:
        dailyQuote =
            'Either you run the day or the day runs you.  —Jim Rohn';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2020/04/18/18/43/background-5060537_640.png';
        break;
         case 16:
        dailyQuote =
            'A man who has committed a mistake and doesn’t correct it is committing another mistake.  —Confucius Kongzi';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/03/25/17/56/color-2174052_640.png';
        break;
         case 17:
        dailyQuote =
            '“A successful man is one who can lay a firm foundation with the bricks others have thrown at him.” —David Brinkley';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/03/31/00/04/orange-700368_640.jpg';
        break;
         case 18:
        dailyQuote =
            'He is a wise man who does not grieve for the things which he has not, but rejoices for those which he has.” —Epictetus';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2021/02/09/22/09/triangles-6000197_640.png';
        break;
         case 19:
        dailyQuote =
            'The most difficult thing is the decision to act; the rest is merely tenacity.” —Amelia Earhart';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/08/13/17/59/background-1591229_1280.jpg';
        break;
         case 20:
        dailyQuote =
            'And the day came when the risk to remain tight in a bud was more painful than the risk it took to blossom.” —Anaïs Nin';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/07/11/18/28/gradient-841144_640.jpg';
        break;
         case 21:
        dailyQuote =
            'Perfection is not attainable. But if we chase perfection we can catch excellence.” —Vince Lombardi';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/10/15/21/23/texture-990088_640.jpg';
        break;
         case 22:
        dailyQuote =
            'Be a positive energy trampoline—absorb what you need and rebound more back.” —Dave Carolan';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/08/13/17/59/background-1591226_640.jpg';
        break;
         case 23:
        dailyQuote =
            'Life is like a sewer … what you get out of it depends on what you put into it.  —Tom Lehrer';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/04/18/17/26/artwork-7141124_640.png';
        break;
         case 24:
        dailyQuote =
            'Alone we can do so little, together we can do so much.” —Helen Keller';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2017/03/25/18/06/color-2174065_640.png';
        break;
         case 25:
        dailyQuote =
            'Just one small positive thought in the morning can change your whole day.” —Dalai Lama';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/03/24/16/42/background-7089457_640.png';
        break;
         case 26:
        dailyQuote =
            'I’d rather regret the things I’ve done than regret the things I haven’t done.” —Lucille Ball';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/07/05/07/42/gradient-7302505_640.png';
        break;
         case 27:
        dailyQuote =
            'Someone’s sitting in the shade today because someone planted a tree a long time ago.” —Warren Buffet';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2022/06/03/17/53/blue-wallpaper-7240665_640.jpg';
        break;
         case 28:
        dailyQuote =
            'Take your victories, whatever they may be, cherish them, use them, but don’t settle for them.” —Mia Hamm';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2015/06/20/07/24/color-815551_640.png';
        break;
         case 29:
        dailyQuote =
            'Be sure you put your feet in the right place, then stand firm.  ―Abraham Lincoln';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/10/15/02/19/purple-1741713_1280.jpg';
        break;
         case 30:
        dailyQuote =
            'Our greatest glory is not in never falling, but in rising every time we fall.” —Confucius';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/08/13/17/59/background-1591229_1280.jpg';
        break;
      default:
        dailyQuote =
            'Success and happiness are not matters of chance but choice. - Zig Ziglar';
        dailyImageUrl =
            'https://cdn.pixabay.com/photo/2016/11/27/12/50/purple-1862798_1280.jpg';
        break;
    }
    notifyListeners();
  }

  Future<void> _startDailyQuoteTimer() async {
    _updateDailyQuote();
    const duration = Duration(hours: 24);
    Timer.periodic(duration, (Timer t) {
      _updateDailyQuote();
    });
  }
 
}

