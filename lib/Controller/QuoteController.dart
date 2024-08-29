/*
import 'dart:convert';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quote_app_db/Helper/DatabaseHelper/databaseHelper.dart';

import '../Modal/quoteModal.dart';

class QuotesController extends GetxController {

  RxList<QuoteModal> quotes = <QuoteModal>[].obs;
  RxList<QuoteModal> favoriteQuote = <QuoteModal>[].obs;
  Set<String> categories = {};
  RxString errorMessage = ''.obs;
  Set<String> _selected = {'ListView'};
  RxBool changeToggle = false.obs;
  RxInt selectedPage = 0.obs;

  void changeTab(int index) {

    selectedPage.value = index;

  }

  @override
  onInit() {
    super.onInit();
    fetchQuoteData();
  }
  void toggle()
  {

  }

  Future<void> fetchQuoteData() async {
    final response = await http.get(
      Uri.parse('https://sheetdb.io/api/v1/accmtecgjck1x'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var item in data) {
        if (item['cate'] != null) {
          categories.add(item['cate']);
        }
      }
      print(
          'Unique Categories:============================================== ${categories.toList()}');
      print('Total Categories: ${categories.length}');
      quotes.assignAll(
        data.map((dynamic item) => QuoteModal.fromJson(item)).toList(),
      );
    } else {
      errorMessage('Unable to Load Quotes');
    }
  }

  Future <void>favoriteQuotes()async{
    // var dbQuotes=await DataBaseHelper.dataBaseHelper
  }
}
*/
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quote_app_db/Helper/DatabaseHelper/databaseHelper.dart';

import '../Modal/quoteModal.dart';

class QuotesController extends GetxController {
  RxList<QuoteModal> quotes = <QuoteModal>[].obs;
  RxList<QuoteModal> favoriteQuote = <QuoteModal>[].obs;
  Set<String> categories = {};
  RxString errorMessage = ''.obs;
  Set<String> _selected = {'ListView'};
  RxBool changeToggle = false.obs;
  RxInt selectedPage = 0.obs;
  GlobalKey imgKey = GlobalKey();
  // Rx<Color>selectTextColor=<Color>Colors.white.obs;

  RxString selectbg = 'Assets/Images/Luxury/a13.jpg'.obs;
  void textSelection(int index)
  {
    // selectTextColor = TextColorList[index];
  }
  void selectBackgroundImage()
  {
    // selectbg=
  }

  // Rx<Color>selectTextColor=Colors.white;

  void changeTab(int index) {
    selectedPage.value = index;
  }

  @override
  onInit() {
    super.onInit();
    fetchQuoteData();
    addFavoriteQuotes();
  }

  void toggle() {}

  Future<void> fetchQuoteData() async {
    final response = await http.get(
      Uri.parse('https://sheetdb.io/api/v1/accmtecgjck1x'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var item in data) {
        if (item['cate'] != null) {
          categories.add(item['cate']);
        }
      }
      print(
          'Unique Categories:============================================== ${categories.toList()}');
      print('Total Categories: ${categories.length}');
      quotes.assignAll(
        data.map((dynamic item) => QuoteModal.fromJson(item)).toList(),
      );
    } else {
      errorMessage('Unable to Load Quotes');
    }
  }

  Future addFavoriteQuotes() async {
    var dbQuotes = await DataBaseHelper.dataBaseHelper.getLikedQuotes();
    favoriteQuote.addAll(
      dbQuotes.map((item) => QuoteModal.fromJson(item)).toList(),
    );
  }

  void likedQuotes(QuoteModal quote) async {
    if (quote.like == "1") {
      await DataBaseHelper.dataBaseHelper.deleteQuote(quote.quote);
      DataBaseHelper.dataBaseHelper.getLikedQuotes();
      quote.like = "0";
      favoriteQuote.remove(quote);
      favoriteQuote.refresh();
      update();
    } else {
      final db = await DataBaseHelper.dataBaseHelper.database;
      await DataBaseHelper.dataBaseHelper
          .insertQuote(quote.cate, quote.quote, quote.author, quote.like);
      quote.like = "1";
      favoriteQuote.add(quote);
    }
    quotes.refresh();
    favoriteQuote.refresh();
    update();
  }
}
