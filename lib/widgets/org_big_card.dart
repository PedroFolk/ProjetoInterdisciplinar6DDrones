import 'package:c6_drones_app/consts/consts.dart';
import 'package:flutter/material.dart';

import '../consts/consts.dart';

class OrgBigCard extends StatefulWidget {
  final double myHeight;

  final double myWidth;

  final double myHeight2;

  final double myWidth2;

  const OrgBigCard({
    super.key,
    required this.myHeight,
    required this.myWidth,
    required this.myHeight2,
    required this.myWidth2,
  });

  @override
  State<OrgBigCard> createState() => _OrgBigCardState();
}

class _OrgBigCardState extends State<OrgBigCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: widget.myHeight,
              width: widget.myWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Organizações",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: widget.myHeight2,
                    width: widget.myWidth2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: corDeFundoPerfil,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.myWidth2 * 0.5,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Razão Social",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  "CPF/CNPJ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                Text(
                                  "ID de identificação",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: widget.myWidth2 * 0.5,
                            decoration: BoxDecoration(
                                color: greyC6,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text("Fazenda Boa"),
                                ),
                                Text("87991800-9"),
                                Text("AGP97J")
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
