import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/CategoryScreen.dart';

import '../../Utils/global.dart';
import 'LikedScreen.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        // leading: Icon(Icons.home),
        title: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          label: Text(
            'Favorites',
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: quoteController.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemBuilder: (context, index) {
          List<String> category = quoteController.categories.toList();
          return GestureDetector(
            onTap: () {
              Get.to(() => LikedPage(category: category[index]));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                margin: EdgeInsets.all(10),
                // padding: EdgeInsets.all(15),
                height: h * 0.10,
                width: w * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:
                      HomeScreenColorlist[index % HomeScreenColorlist.length],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      category[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
