import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/widgets/field_perfil.dart';
import 'package:c6_drones_app/widgets/text_perfil.dart';
import 'package:flutter/material.dart';

class MyCardSmall extends StatelessWidget {
  final double myHeight;
  final double myWidth;
  final double fieldWidth;
  final Image img;
  const MyCardSmall({
    super.key,
    required this.myHeight,
    required this.myWidth,
    required this.fieldWidth,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController? perfilController;
    TextEditingController? emailController;
    TextEditingController? celularController;
    TextEditingController? enderecoController;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Perfil",
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
                    height: myHeight,
                    width: myWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: corDeFundoPerfil,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                img,
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextPerfil(nomeValor: "perfil"),
                                        TextPerfil(nomeValor: "email"),
                                        TextPerfil(nomeValor: "celular"),
                                        TextPerfil(nomeValor: "endereço")
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FieldsPerfil(
                                        valor: "valor",
                                        width: fieldWidth,
                                        controller: perfilController,
                                        enabled: false,
                                        readOnly: true,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: fieldWidth,
                                        controller: emailController,
                                        enabled: false,
                                        readOnly: true,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: fieldWidth,
                                        controller: celularController,
                                        enabled: false,
                                        readOnly: true,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: fieldWidth,
                                        controller: enderecoController,
                                        enabled: true,
                                        readOnly: false,
                                      ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
