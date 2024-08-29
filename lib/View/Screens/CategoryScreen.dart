import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/HomeScreen.dart';
import 'package:share_plus/share_plus.dart';

import '../../Controller/QuoteController.dart';
import '../../Utils/global.dart';
import 'HomeScreen.dart';

var quoteController = Get.put(QuotesController());

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final filteredQuotes = quoteController.quotes
        .where((quote) => quote.cate == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        backgroundColor: Colors.greenAccent.shade100,
        // Color(0xffB2EDFD),
        // Color(0xffFFE9A6),
        // Color(0xffC3F6BC),
        // Color(0xffDBCCFD),
        centerTitle: true,
        title: Text(
          '$category',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredQuotes.length,
        itemBuilder: (context, index) {
          return Container(
            height: h * 0.45,
            width: w * 0.85,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: HomeScreenColorlist[index % HomeScreenColorlist.length],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  filteredQuotes[index].quote,
                  style: TextStyle(color: Colors.green.shade900, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Share.share(
                            '${quoteController.quotes[index].quote} - ${quoteController.quotes[index].author}');
                      },
                      icon: Icon(
                        CupertinoIcons.share,
                        color: Colors.green.shade900,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.065,
                    ),
                    IconButton(
                      icon: Icon(
                        quoteController.quotes[index].like == "1"
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: quoteController.quotes[index].like == "1"
                            ? Colors.red
                            : Colors.green.shade900,
                        size: 30,
                      ),
                      onPressed: () {
                        quoteController
                            .likedQuotes(quoteController.quotes[index]);
                      },
                    ),
                    SizedBox(
                      width: w * 0.065,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.copy_rounded,
                          color: Colors.green.shade900,
                          size: 30,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                              text:
                                  '${quoteController.quotes[index].quote} - ${quoteController.quotes[index].author}'));
                          Get.snackbar(
                            backgroundColor: Color(0xffC3F6BC),
                            'Copied',
                            'Quote copied to clipboard',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
