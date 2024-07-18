import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/Quotesview/QuotesViewPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Categoryviews extends StatefulWidget {
  final Key? key;

  const Categoryviews({this.key}) : super(key: key);

  @override
  State<Categoryviews> createState() => _CategoryviewsState();
}

class _CategoryviewsState extends State<Categoryviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Category',
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Your Favourite Category',
                  prefixIcon: Icon(Icons.read_more_sharp,
                      color: Colors.black, size: 30),
                  suffixIcon: Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2.2),
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  String imageUrl;
                  String text;

                  switch (index % 8) {
                    case 0:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2019/09/30/10/12/notredame-de-paris-4515298_1280.jpg';
                      text = 'Life';
                      break;
                    case 1:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2019/06/25/06/26/mosque-4297544_1280.png';
                      text = 'Islamic';
                      break;
                    case 2:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2024/01/15/14/30/rubber-duck-8510271_1280.png';
                      text = 'Nature';
                      break;
                    case 3:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2022/07/05/19/27/enjoy-every-moment-7303831_1280.png';
                      text = 'Motivational';
                      break;
                    case 4:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2016/04/24/05/52/hearts-1348869_1280.png';
                      text = 'Love';
                      break;
                    case 5:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2022/01/02/22/30/camera-6911340_960_720.png';
                      text = 'Wisdom';
                      break;
                    case 6:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2020/01/12/19/15/owl-4760851_1280.png';
                      text = 'Funny';
                      break;
                    case 7:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2016/03/16/18/55/friends-1261492_960_720.png';
                      text = 'Friendship';
                      break;
                    default:
                      imageUrl =
                          'https://cdn.pixabay.com/photo/2024/06/30/16/37/cat-8863536_1280.png';
                      text = 'Default';
                      break;
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> QuotesViewPage()));
                    },
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            imageUrl,
                            width: 100,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            text,
                            style:GoogleFonts.ubuntu(
                             textStyle:TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
