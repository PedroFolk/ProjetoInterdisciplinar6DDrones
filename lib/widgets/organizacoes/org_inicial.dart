import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/widgets/organizacoes/org_rows.dart';
import 'package:c6_drones_app/widgets/titulo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrgPagInicial extends StatefulWidget {
  const OrgPagInicial({super.key});

  @override
  State<OrgPagInicial> createState() => _OrgPagInicialState();
}

class _OrgPagInicialState extends State<OrgPagInicial> {
  //Variaveis
  var corBotaoAdd = blueC6;
  var corAdd = Colors.grey[200];
  var corRemove = Colors.grey[200];

  var corBotaoRemove = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    final orgs = context.read<ModelA>();
    return Consumer<ModelA>(
      builder: (context, value, child) => Column(
        children: [
          //Titulo da pagina
          const TituloPags(
            titulo: "Organizações",
          ),

          //
          const SizedBox(
            height: 50,
          ),

          //Titulo Conteudo Projetos
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Razão Social / Nome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'CPF/CNPJ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'ID de identificação',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          ),

          //
          const SizedBox(
            height: 30,
          ),

          //Conteudo do projetos
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(17, 0, 0, 0),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: orgs.organizacoes.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrganizacaoRow(
                    index: index,
                    deletando: orgs.deletando,
                    rz: orgs.organizacoes[index]['razao'],
                    cpfCnpj: orgs.organizacoes[index]['cpfCnpj'],
                    id: orgs.organizacoes[index]['id'],
                    onTap: () {
                      if (orgs.deletando == true) {
                        _showMyDialog(index);
                        // orgs.deletarOrg(index);
                      } else {
                        final orgId = context.read<ModelA>();
                        orgId.setOrgIdSelector(index);
                        final counter = context.read<ModelA>();
                        counter.setPage(0);
                      }
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ),

          //Adicionar projetos
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    final counter = context.read<ModelA>();
                    counter.setPage(1);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        corBotaoAdd = lightBlueC6;
                        corAdd = Colors.grey[300];
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        corAdd = Colors.grey[200];
                        corBotaoAdd = blueC6;
                      });
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: corAdd,
                        border: Border.all(color: corBotaoAdd, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.add_box_outlined,
                              color: corBotaoAdd,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //Remover
                GestureDetector(
                  onTap: deletandoOrg,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        corBotaoRemove = orgs.deletando
                            ? Colors.red
                            : const Color.fromARGB(255, 218, 126, 126);
                        corRemove = Colors.grey[300];
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        corBotaoRemove =
                            orgs.deletando ? Colors.red : Colors.grey;
                        corRemove = Colors.grey[200];
                      });
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: corBotaoRemove!),
                        color: corRemove,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.delete_forever_outlined,
                              color: corBotaoRemove,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void deletandoOrg() {
    final orgs = context.read<ModelA>();

    orgs.toggleDeletando();
  }

  Future<void> _showMyDialog(int index) async {
    final orgs = context.read<ModelA>();
    var razao = orgs.organizacoes[index]['razao'].toString();
    var textoAviso = RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          const TextSpan(text: 'Você deseja deletar a organização '),
          TextSpan(
              text: "${razao.toString()}?",
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ATENÇÃO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: corContainer,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                textoAviso,
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Cancelar
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: corContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Deletar
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      orgs.deletarOrg(index);
                      orgs.toggleDeletando();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Deletar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
