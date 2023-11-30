import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/widgets/buttons_edit_save.dart';
import 'package:c6_drones_app/widgets/perfil/p_field.dart';
import 'package:c6_drones_app/widgets/perfil/p_text.dart';
import 'package:c6_drones_app/widgets/titulo.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  Image img = perfilImg;
  TextEditingController? nomeController;
  TextEditingController? emailController;
  TextEditingController? celularController;
  TextEditingController? organizacaoController;

  bool editando = false;
  bool enable = false;
  bool onlyread = true;

  @override
  void initState() {
    final users = context.read<ModelA>();
    super.initState();
    String nome = users.usuarios[1]['nome'];
    String email = users.usuarios[1]['email'];
    String celular = users.usuarios[1]['celular'];
    String celularMaskInicial =
        '(${celular[0]}${celular[1]}) ${celular.substring(2, 7)}-${celular.substring(7, 11)}';
    String organizacao = users.usuarios[1]['organizacao'];

    // Initialize the TextEditingControllers with the initial values
    nomeController = TextEditingController(text: nome);
    emailController = TextEditingController(text: email);
    celularController = TextEditingController(text: celularMaskInicial);
    organizacaoController = TextEditingController(text: organizacao);
  }

  String? nomeControllerTextOld;
  String? emailControllerTextOld;
  String? celularControllerTextOld;
  String? organizacaoControllerTextOld;

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueC6,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //Titulo
                const TituloPags(
                  titulo: "Perfil",
                ),

                //Conteúdo
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Imagem
                          img,

                          //
                          Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextPerfil(nomeValor: "nome"),
                                  TextPerfil(nomeValor: "email"),
                                  TextPerfil(nomeValor: "celular"),
                                  TextPerfil(nomeValor: "organização"),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Nome
                                  FieldsPerfil(
                                    width: 350,
                                    controller: nomeController,
                                    enabled: enable,
                                    readOnly: onlyread,
                                  ),

                                  //Email
                                  FieldsPerfil(
                                    width: 350,
                                    controller: emailController,
                                    enabled: enable,
                                    readOnly: onlyread,
                                  ),

                                  //Celular
                                  FieldsPerfil(
                                    width: 350,
                                    controller: celularController,
                                    enabled: enable,
                                    readOnly: onlyread,
                                    inputFormatters: [celularMask],
                                  ),

                                  //Endereço
                                  FieldsPerfil(
                                    width: 350,
                                    controller: organizacaoController,
                                    enabled: enable,
                                    readOnly: onlyread,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                //
                EditSaveButtons(
                  editando: editando,
                  funcEditar: editar,
                  funcSalvar: salvar,
                  funcCancelar: cancelar,
                ),

                //
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editar() {
    setState(() {
      //
      nomeControllerTextOld = nomeController?.text;
      emailControllerTextOld = emailController?.text;
      celularControllerTextOld = celularController?.text;
      organizacaoControllerTextOld = organizacaoController?.text;
      editando = !editando;
      if (editando == true) {
        enable = true;
        onlyread = false;
      }
    });
  }

  void salvar() {
    setState(() {
      editando = !editando;
      if (editando == false) {
        enable = false;
        onlyread = true;
      }
    });
  }

  void cancelar() {
    setState(() {
      //Volta estado
      nomeController!.text = nomeControllerTextOld!;
      emailController!.text = emailControllerTextOld!;
      celularController!.text = celularControllerTextOld!;
      organizacaoController!.text = organizacaoControllerTextOld!;

      editando = !editando;
      if (editando == false) {
        enable = false;
        onlyread = true;
      }
    });
  }

  var celularMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late var celularSoNumero = celularMask.getUnmaskedText();
  late var celularFormatado = celularMask.getMaskedText();
}
