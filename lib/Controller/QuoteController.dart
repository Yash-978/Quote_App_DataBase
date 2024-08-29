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
