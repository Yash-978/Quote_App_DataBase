/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/HomeScreen.dart';

import 'View/Screens/QuoteScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage(),),
        GetPage(name: '/quote', page: () => const QuotePage(),),
      ],

    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/HomeScreen.dart';

import 'View/Screens/QuoteScreen.dart';
import 'View/Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const SplashPage(),),
        GetPage(name: '/quote', page: () => const QuotePage(),),
      ],

    );
  }
}

