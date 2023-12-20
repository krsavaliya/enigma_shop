// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

// import 'dart:js';

import 'package:enigma_shops/models/shop.dart';
import 'package:enigma_shops/pages/cart_page.dart';
import 'package:enigma_shops/pages/intro_page.dart';
import 'package:enigma_shops/pages/shop_page.dart';
import 'package:enigma_shops/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(),
    child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const IntroPage(),
      theme: lightMode, 
      routes:  {
        '/intro_page':(context) => const IntroPage(),
        '/shop_page':(context) => const ShopPage(),
        '/cart_page':(context) => const CartPage(),
      },

    );
  }
}