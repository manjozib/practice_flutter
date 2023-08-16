import 'package:flutter/material.dart';
import 'package:practice_flutter/features/splash/presentation/widgets/splash_loading.dart';
import 'package:practice_flutter/styles/colors.dart';




class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PersonalPortfolioColors.mainBlue,
      body: SplashLoading(
        message: 'Loading an awesome, \n Blessing Profile',
      ),
    );
  }
}
