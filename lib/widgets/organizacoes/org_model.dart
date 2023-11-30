import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/widgets/buttons_edit_save.dart';
import 'package:c6_drones_app/widgets/titulo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var enable = false;

class OrgModelPage extends StatefulWidget {
  final String responsavel;
  final String razaoOuNome;
  final String cpfCnpj;
  final String endereco;
  final String idOrg;
  final String projeto;

  const OrgModelPage({
    super.key,
    required this.responsavel,
    required this.razaoOuNome,
    required this.cpfCnpj,
    required this.endereco,
    required this.projeto,
    required this.idOrg,
  });

  @override
  State<OrgModelPage> createState() => _OrgModelPageState();
}

class _OrgModelPageState extends State<OrgModelPage> {
  TextEditingController? responsavelController;
  TextEditingController? razaoController;
  TextEditingController? cpfCnpjController;
  TextEditingController? enderecoController;
  TextEditingController? docsController;

  @override
  void initState() {
    responsavelController = TextEditingController(text: widget.responsavel);
    razaoController = TextEditingController(text: widget.razaoOuNome);
    cpfCnpjController = TextEditingController(text: widget.cpfCnpj);
    enderecoController = TextEditingController(text: widget.endereco);
    docsController = TextEditingController(text: "widget.doc");

    //
    responsavelController?.text = widget.responsavel;
    razaoController?.text = widget.razaoOuNome;
    cpfCnpjController?.text = widget.cpfCnpj;
    enderecoController?.text = widget.endereco;
    docsController?.text = "widget.d";
    super.initState();
  }

  String? responsavelTextOld;
  String? razaoTextOld;
  String? cpfCnpjTextOld;
  String? enderecoTextOld;
  String? docsTextOld;
  String? projetosTextOld;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TituloPags(titulo: widget.razaoOuNome),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //
                    valores(
                      "Responsavel pela organização",
                      responsavelController,
                    ),

                    //
                    valores(
                      "Razão social ou nome",
                      razaoController,
                    ),

                    //

                    valores(
                      "CPF/CNPJ",
                      cpfCnpjController,
                    ),

                    //

                    //
                    valores(
                      "Endereço do contrato social",
                      enderecoController,
                    ),

                    //
                    valoresFixos(
                      "ID da organização",
                      widget.idOrg,
                    ),

                    //
                    valorClicavel(
                      "Projetos associados",
                      widget.projeto,
                    ),

                    //
                  ],
                ),
              ),
            ),
          ),
        ),
        EditSaveButtons(
          editando: enable,
          funcEditar: editar,
          funcSalvar: salvar,
          funcCancelar: cancelar,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  final counter = context.read<ModelA>();
                  counter.setPage(-1);
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(
                    color: blueC6,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //Salvar

  void salvar() {
    var index = widget.idOrg;
    final orgs = context.read<ModelA>();
    if (responsavelController!.text != '' &&
        razaoController!.text != '' &&
        cpfCnpjController!.text != '' &&
        enderecoController!.text != '') {
      orgs.atualizaOrgs(
        int.parse(index) - 1,
        responsavelController!.text,
        razaoController!.text,
        cpfCnpjController!.text,
        enderecoController!.text,
      );

      enable = false;
      print(responsavelController!.text);
    }
  }

  //Cancelar
  void cancelar() {
    setState(() {
      //Volta estado
      responsavelController!.text = responsavelTextOld!;
      razaoController!.text = razaoTextOld!;
      cpfCnpjController!.text = cpfCnpjTextOld!;
      enderecoController!.text = enderecoTextOld!;
      docsController!.text = docsTextOld!;

      enable = false;
    });
  }

  //Editar
  void editar() {
    setState(() {
      responsavelTextOld = responsavelController!.text;
      razaoTextOld = razaoController!.text;
      cpfCnpjTextOld = cpfCnpjController!.text;
      enderecoTextOld = enderecoController!.text;
      docsTextOld = docsController!.text;

      enable = true;
    });
  }
}

Widget valorClicavel(String titulo, String valor) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelText(
        value: titulo,
      ),
      MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text(
              valor,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget valoresFixos(String titulo, String valor) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelText(value: titulo),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 10, left: 15),
        child: Text(
          valor,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}

Widget valores(String titulo, TextEditingController? controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //
      LabelText(value: titulo),
      TextFieldOrg(
        controller: controller,
      ),
    ],
  );
}

class TextFieldOrg extends StatelessWidget {
  const TextFieldOrg({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 2),
      child: TextField(
        controller: controller,
        enabled: enable,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 2),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  final String value;

  const LabelText({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
