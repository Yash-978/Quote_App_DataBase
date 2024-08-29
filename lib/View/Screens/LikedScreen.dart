import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/CategoryScreen.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../Utils/global.dart';

class LikedPage extends StatefulWidget {
  final String category;

  const LikedPage({super.key, required this.category});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // final filterdQuotes=quoteController.quotes.where((quote)=>quote.cate==widget.category && quote.like=='1').toList();

    final filteredQuotes = quoteController.quotes
        .where((quote) => quote.cate == widget.category && quote.like == '1')
        .toList();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        // leading: Icon(Icons.home),
        centerTitle: true,
        title: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          label: Text('Favorite Quotes'),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredQuotes.length,
        itemBuilder: (context, index) => Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        filteredQuotes[index].quote,
                        style: TextStyle(
                            color: Colors.green.shade900, fontSize: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          "${filteredQuotes[index].author}",
                          style: TextStyle(
                              color: Colors.green.shade900, fontSize: 20),
                        ),
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
                            icon: Icon(filteredQuotes[index].like== "1" ? Icons.favorite : Icons.favorite_border,
                              color: filteredQuotes[index].like== "1" ? Colors.red : Colors.green.shade900,
                              size: 30,),
                            onPressed: () {
                              setState(() {
                                quoteController.likedQuotes(filteredQuotes[index]);
                              });
                            },
                          ),
                          // IconButton(
                          //   icon: Icon(
                          //     filteredQuotes[index].like == "1"
                          //         ? Icons.favorite
                          //         : Icons.favorite_border,
                          //     color: filteredQuotes[index].like == "1"
                          //         ? Colors.red
                          //         : Colors.green.shade900,
                          //     size: 30,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       // quoteController.likedQuote(filteredQuotes[index]);
                          //       quoteController
                          //           .likedQuotes(filteredQuotes[index]);
                          //     });
                          //   },
                          // ),
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
                                  backgroundColor: Colors.yellow.shade100,
                                  'Copied',
                                  'Quote copied to clipboard',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
