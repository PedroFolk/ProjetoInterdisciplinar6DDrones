import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/widgets/card_big.dart';
import 'package:c6_drones_app/widgets/card_small.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueC6,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          Image img = perfilImg;

          if (width >= 800 && width < 1400) {
            return MyCardBig(
              myHeight: 700,
              myWidth: 1000,
              fieldWidth: 300,
              myHeight2: 550,
              myWidth2: 1500,
              img: img,
            );

            //
          } else if (width < 800) {
            return MyCardSmall(
              myHeight: height - (height * 0.2),
              myWidth: width - (width * 0.05),
              fieldWidth: (width * 0.5),
              img: img,
            );

            //
          } else {
            return MyCardBig(
              myHeight: height - (height * 0.2),
              myWidth: width - (width * 0.1),
              fieldWidth: 500,
              myHeight2: height * 0.6,
              myWidth2: width,
              img: img,
            );
          }

          //
        },
      ),
    );
  }
}
