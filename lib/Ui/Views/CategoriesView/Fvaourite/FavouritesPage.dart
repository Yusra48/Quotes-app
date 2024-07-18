import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Models/QuotesItem.dart';
import 'package:flutter_application_1/Ui/Views/Screens/ImageviewScreen/ImageViewmodel.dart';
import 'package:stacked/stacked.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImageViewModel>.reactive(
      viewModelBuilder: () => ImageViewModel(),
      builder: (context, model, child) {
        final favoriteItems = model.quoteItems.where((item) => item.isFavorite).toList();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Favorite Quotes & Images',
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
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemCount: favoriteItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = favoriteItems[index];
                return _buildFavoriteItem(context, item, model);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildFavoriteItem(BuildContext context, QuoteData item, ImageViewModel model) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    final index = model.quoteItems.indexOf(item);
                    model.toggleFavorite(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.grey[800]),
                  onPressed: () {
                    model.shareImage(item.imagePath);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
