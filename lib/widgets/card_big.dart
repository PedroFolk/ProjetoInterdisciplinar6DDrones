import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/widgets/field_perfil.dart';
import 'package:c6_drones_app/widgets/perfil_buttons.dart';
import 'package:c6_drones_app/widgets/text_perfil.dart';
import 'package:flutter/material.dart';

class MyCardBig extends StatefulWidget {
  final double myHeight;
  final double myHeight2;

  final double myWidth;
  final double myWidth2;

  final double fieldWidth;

  final Image img;

  const MyCardBig({
    super.key,
    required this.myHeight,
    required this.myWidth,
    required this.fieldWidth,
    required this.myHeight2,
    required this.myWidth2,
    required this.img,
  });

  @override
  State<MyCardBig> createState() => _MyCardBigState();
}

class _MyCardBigState extends State<MyCardBig> {
  TextEditingController? perfilController;
  TextEditingController? emailController;
  TextEditingController? celularController;
  TextEditingController? enderecoController;

  var editando = false;
  var enable = false;
  var onlyread = true;

  @override
  void initState() {
    super.initState();
    String perfil = "ola";
    String email = "ola";
    String celular = "ola";
    String endereco = "ola";

    // Initialize the TextEditingControllers with the initial values
    perfilController = TextEditingController(text: perfil);
    emailController = TextEditingController(text: email);
    celularController = TextEditingController(text: celular);
    enderecoController = TextEditingController(text: endereco);
  }

  var perfilControllerTextOld;
  var emailControllerTextOld;
  var celularControllerTextOld;
  var enderecoControllerTextOld;

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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              widget.img,
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextPerfil(nomeValor: "perfil"),
                                      TextPerfil(nomeValor: "email"),
                                      TextPerfil(nomeValor: "celular"),
                                      TextPerfil(nomeValor: "endereço"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: widget.fieldWidth,
                                        controller: perfilController,
                                        enabled: enable,
                                        readOnly: onlyread,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: widget.fieldWidth,
                                        controller: emailController,
                                        enabled: enable,
                                        readOnly: onlyread,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: widget.fieldWidth,
                                        controller: celularController,
                                        enabled: enable,
                                        readOnly: onlyread,
                                      ),
                                      FieldsPerfil(
                                        valor: "valor",
                                        width: widget.fieldWidth,
                                        controller: enderecoController,
                                        enabled: enable,
                                        readOnly: onlyread,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // Botão editar
                          PerfilButtons(
                              editando: editando,
                              funcEditar: () {
                                setState(() {
                                  //

                                  perfilControllerTextOld =
                                      perfilController?.text;

                                  emailControllerTextOld =
                                      emailController?.text;

                                  celularControllerTextOld =
                                      celularController?.text;

                                  enderecoControllerTextOld =
                                      enderecoController?.text;

                                  //
                                  editando = !editando;
                                  if (editando == true) {
                                    enable = true;
                                    onlyread = false;
                                  }
                                });
                              },
                              funcSalvar: () {
                                setState(() {
                                  editando = !editando;
                                  if (editando == false) {
                                    enable = false;
                                    onlyread = true;
                                  }
                                });
                              },
                              funcCancelar: () {
                                setState(() {
                                  //Volta estado
                                  perfilController!.text =
                                      perfilControllerTextOld;

                                  emailController!.text =
                                      emailControllerTextOld;

                                  celularController!.text =
                                      celularControllerTextOld;

                                  enderecoController!.text =
                                      enderecoControllerTextOld;

                                  //
                                  editando = !editando;
                                  if (editando == false) {
                                    enable = false;
                                    onlyread = true;
                                  }
                                });
                              }),
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
