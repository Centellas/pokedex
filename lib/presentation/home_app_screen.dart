import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CasaScreen extends StatelessWidget {
  const CasaScreen({super.key});
  
  final String imageLogo = 'assets/images/logo.png';
  final String bulbasaur = 'assets/images/1.png';
  final String charmander = 'assets/images/4.png';
  final String squitle = 'assets/images/7.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageLogo, width: 250, height: 250),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   //SizedBox(width: 32),
                    Image.asset(bulbasaur, width: 100, height: 100),
                    SizedBox(width: 32),
                    Image.asset(charmander, width: 100, height: 100),
                    SizedBox(width: 32),
                    Image.asset(squitle, width: 100, height: 100),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}



