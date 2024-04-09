import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valencia_ex6/pages/cart.dart';
import 'package:valencia_ex6/pages/catalog.dart';
import 'package:valencia_ex6/pages/checkout.dart';
import 'package:valencia_ex6/provider/cart_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ShoppingCart(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 6: State Management",
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.blue,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/",
      routes: {
        "/": (context) => CatalogPage(),
        "/cart": (context) => CartPage(),
        "/checkout": (context) => CheckoutPage(),
      },
    );
  }
}
