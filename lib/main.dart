import 'package:flutter/material.dart';
import 'package:practice_flutter/features/splash/presentation/pages/splash_page.dart';

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
        home: SplashPage(),
    );
  }
}


