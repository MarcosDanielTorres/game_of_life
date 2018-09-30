import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final double heigth = 66.0;
  final String name = "Juego de la vida";

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarSize),
      height: statusBarSize + this.heigth,
      child: Center(
        child: Text(name),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
