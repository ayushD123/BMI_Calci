import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'first.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            color: Color(0xFF0A0E21)
          ),
          scaffoldBackgroundColor: Color(0xFF0A0E23)
        ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/spash.json'),
        nextScreen: InputPage(),
    splashIconSize: 400,
    duration: 2000,
    splashTransition: SplashTransition.fadeTransition,
    pageTransitionType: PageTransitionType.fade,
    backgroundColor:Color(0xFF0A0E21));

  }
}

