import 'package:djubli/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Djubli_App());

class Djubli_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
