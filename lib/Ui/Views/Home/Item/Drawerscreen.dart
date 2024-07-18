import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/Fvaourite/FavouritesPage.dart';
import 'package:flutter_application_1/Ui/Views/Home/Item/MyQuoteView.dart';
import 'package:flutter_application_1/Ui/Views/Screens/QuotesScreen/bookmark/bookmarkquote.dart';
import 'package:google_fonts/google_fonts.dart';


class Drawerscreen extends StatelessWidget {
  const Drawerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.black,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.cancel_outlined),
                            color: Colors.black26,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2018/08/03/12/18/wolf-3581809_1280.jpg'),
                          radius: 40,
                        ),
                        const SizedBox(height: 3),
                         Text(
                          'Quotely',
                          style:GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1.5,
                          ),
                        ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'grimuser@gmail.com',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        "My Quotes",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyQuotesView()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Favourites",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritePage()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Bookmark quotes",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookmarkquote()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Connect with google",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Enter your Email",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0))),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "FAQ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Contact Us",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}