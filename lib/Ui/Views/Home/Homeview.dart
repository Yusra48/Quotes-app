import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Views/Home/HomeViewmodel.dart';
import 'package:flutter_application_1/Ui/Views/Home/Item/Drawerscreen.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/CategoryViews.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/Fvaourite/FavouritesPage.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/ProfileView.dart';
import 'package:flutter_application_1/Ui/Views/Screens/QuotesScreen/ViewQuotesPage.dart';
import 'package:flutter_application_1/Ui/Views/Screens/ImageviewScreen/ViewallPage.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DailyQuoteViewModel>.reactive(
      viewModelBuilder: () => DailyQuoteViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          drawer: Drawerscreen(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Home',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: [
                  SizedBox(width: 7),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s Quote',
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(model.dailyImageUrl),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20),
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Text(
                        model.dailyQuote,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSectionTitle(context, 'Trending Quotes', 'View All', 0),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        _buildImage('assets/Work.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/Robert.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/mind.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/knowledge.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/Einstein.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/creativity.jpg'),
                        SizedBox(width: 10),
                        _buildImage('assets/Believe.jpg'),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSectionTitle(context, 'Latest Quotes', 'View All', 1),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        _buildLatestQuote(
                          'When you change your thoughts, remember to also change your world.” —Norman Vincent Peale',
                          Colors.purple[700]!,
                        ),
                        SizedBox(width: 10),
                        _buildLatestQuote(
                          'The only way to do great work is to love what you do. –Steve Jobs',
                          Colors.blue[700]!,
                        ),
                        SizedBox(width: 10),
                        _buildLatestQuote(
                          'The only limit to our realization of tomorrow will be our doubts of today. –Franklin D. Roosevelt',
                          Colors.green[700]!,
                        ),
                        SizedBox(width: 10),
                        _buildLatestQuote(
                          'The best way to predict the future is to create it. –Abraham Lincoln',
                          Colors.orange[700]!,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.black),
              currentIndex: 0,
              onTap: (index) {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Categoryviews(),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritePage(),
                      ),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileView(),
                      ),
                    );
                    break;
                  default:
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, String actionText, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => index == 0 ? ViewallPage() : ViewQuotesPage(),
              ),
            );
          },
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String path) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestQuote(String quote, Color color) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.auto_awesome_motion,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              quote,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}