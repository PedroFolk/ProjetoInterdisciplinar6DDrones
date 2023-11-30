import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/widgets/buttons_edit_save.dart';
import 'package:c6_drones_app/widgets/organizacoes/org_fields.dart';
import 'package:c6_drones_app/widgets/titulo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrgCadastros extends StatefulWidget {
  const OrgCadastros({
    super.key,
  });

  @override
  State<OrgCadastros> createState() => _OrgCadastrosState();
}

class _OrgCadastrosState extends State<OrgCadastros> {
  TextEditingController? responsavelController;
  TextEditingController? razaoController;
  TextEditingController? cpfCnpjController;
  TextEditingController? enderecoController;
  TextEditingController? docsController;
  TextEditingController? idController;
  TextEditingController? projetosController;

  var editando = true;
  var enable = true;
  var onlyread = false;

  @override
  void initState() {
    super.initState();
    String responsavel = "";
    String razao = "";
    String cpfCnpj = "";
    String endereco = "";
    String docs = "";
    String id = "";
    String projs = "";

    // Initialize the TextEditingControllers with the initial values
    responsavelController = TextEditingController(text: responsavel);
    razaoController = TextEditingController(text: razao);
    cpfCnpjController = TextEditingController(text: cpfCnpj);
    enderecoController = TextEditingController(text: endereco);
    docsController = TextEditingController(text: docs);
    idController = TextEditingController(text: id);
    projetosController = TextEditingController(text: projs);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const TituloPags(titulo: "Cadastro Organizações"),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OrgText(value: "Resposável da organização:"),
                    OrgText(value: "Razão Social ou Nome:"),
                    OrgText(value: "CPF/CNPJ: "),
                    OrgText(value: "Endereço do Contrato social: "),
                    OrgText(value: "Documentos da organização:"),
                    OrgText(value: "Projetos associados:"),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FieldsOrg(
                      width: 350,
                      controller: responsavelController,
                      readOnly: onlyread,
                      enabled: enable,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Por favor insira um valor valido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    FieldsOrg(
                      width: 350,
                      controller: razaoController,
                      readOnly: onlyread,
                      enabled: enable,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Por favor insira um valor valido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    FieldsOrg(
                      width: 350,
                      controller: cpfCnpjController,
                      readOnly: onlyread,
                      enabled: enable,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Por favor insira um valor valido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    FieldsOrg(
                      width: 350,
                      controller: enderecoController,
                      readOnly: onlyread,
                      enabled: enable,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Por favor insira um valor valido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    FieldsOrg(
                      width: 350,
                      controller: docsController,
                      readOnly: onlyread,
                      enabled: enable,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Por favor insira um valor valido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    FieldsOrg(
                      width: 350,
                      controller: projetosController,
                      readOnly: onlyread,
                      enabled: enable,
                    ),
                  ],
                ),
              ],
            ),
          ),
          EditSaveButtons(
              editando: editando,
              funcEditar: editar,
              funcSalvar: salvar,
              funcCancelar: cancelar)
        ],
      ),
    );
  }

  void cancelar() {
    final counter = context.read<ModelA>();
    counter.setPage(-1);
  }

  void salvar() {
    final orgs = context.read<ModelA>();
    int trueId = orgs.orgId;

    for (var i = 0; i < orgs.organizacoes.length; i++) {
      if (orgs.organizacoes[i]['id'] == orgs.orgId.toString().padLeft(3, '0')) {
        orgs.incrementOrgId();
      }
      trueId = orgs.orgId;
    }

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> novaOrg = {
        'responsavel': responsavelController!.text,
        'razao': razaoController!.text,
        'cpfCnpj': cpfCnpjController!.text,
        'endereco': enderecoController!.text,
        'id': trueId.toString().padLeft(3, '0'),
        'projeto': projetosController!.text
      };

      orgs.organizacoes.add(novaOrg);
      final counter = context.read<ModelA>();
      counter.setPage(-1);
    } else {
      print("Deu errado algo");
    }
    orgs.resetOrgId();
  }

  void editar() {
    setState(() {
      //

      editando = !editando;
      if (editando == true) {
        enable = true;
        onlyread = false;
      }
    });
  }
}

class OrgText extends StatelessWidget {
  final String value;
  const OrgText({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
