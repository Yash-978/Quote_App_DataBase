/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/Controller/QuoteController.dart';

import '../../Utils/global.dart';

var quoteController = Get.put(QuotesController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
      ),
      body: GridView.builder(
        itemCount: Quote_Type_Categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/quote');
          },
          // onTap: () {
          //   selectedindex = index;
          //   categoryStore.clear();
          //   for (int i = 0;
          //   i < quoteModelQ1!.quoteModel_List.length;
          //   i++) {
          //     if (category[index] == quoteModelQ1!.quoteModel_List[i].cate)
          //     {
          //       categoryStore.add(QuoteList[i]);
          //     }
          //   }
          //   Navigator.of(context).pushNamed('/quote');
          // },

          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              margin: EdgeInsets.all(10),
              // padding: EdgeInsets.all(15),
              height: h * 0.10,
              width: w * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: HomeScreenColorlist[index % HomeScreenColorlist.length],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Quote_Type_Categories[index]['home_Icon'],
                    size: 40,
                    color: Quote_Type_Categories[index]['home_color'],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    Quote_Type_Categories[index]['home_Text'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/Controller/QuoteController.dart';
import 'package:quote_app_db/View/Screens/QuoteScreen.dart';

import '../../Utils/global.dart';
import 'CategoryScreen.dart';

var quoteController = Get.put(QuotesController());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        // leading: Icon(Icons.home),
        centerTitle: true,
        title: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.home),
          label: Text('Home'),
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
              Get.to(() => CategoryPage(category: category[index]));
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
                        color: Colors.green.shade900
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

