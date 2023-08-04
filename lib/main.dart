import 'package:flutter/material.dart';

final Color mainYellow = Color(0xFFFFB02F);
final Color primaryGray = Color(0xFF313131);
final Color secondaryGray = Color(0xFF1C1C1C);
final Color lightGray = Color(0xFF3B3B3B);

void main() {
  runApp(
    MaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryGray,
              secondaryGray
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      ),
    );
  }
}
