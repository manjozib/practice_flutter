import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Portfolio App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Product Sans',
        ),
        home: const SizedBox.shrink()
    );
  }
}


