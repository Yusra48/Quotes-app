import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Views/CategoriesView/Quotesview/Quotesviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


class QuotesViewPage extends StatelessWidget {
  const QuotesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuotesViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 25),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Quotes',
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
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Consumer<QuotesViewModel>(
            builder: (context, model, child) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                itemCount: model.quoteItems.length,
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            model.quoteItems[index].imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            model.quoteItems[index].isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: model.quoteItems[index].isFavorite
                                ? Colors.red
                                : Colors.grey[800],
                          ),
                          onPressed: () {
                            model.toggleFavorite(index);
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(Icons.share, color: Colors.grey[800]),
                          onPressed: () {
                            model.shareImage(model.quoteItems[index].imagePath);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
