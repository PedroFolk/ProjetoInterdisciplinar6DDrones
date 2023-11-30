import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/pages/main_page.dart';
import 'package:c6_drones_app/widgets/projetos/proj_rows.dart';
import 'package:c6_drones_app/widgets/titulo.dart';
import 'package:flutter/material.dart';

class Projetos extends StatefulWidget {
  const Projetos({super.key});

  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  //Variaveis
  var corContainer = const Color.fromARGB(255, 175, 218, 126);

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
                //Titulo da pagina
                TituloPags(
                  titulo: "Projetos",
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
                          'Projeto',
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
                          'Organização',
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
                    )
                  ],
                ),

                //
                const SizedBox(
                  height: 30,
                ),

                //Conteudo do projetos
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ProjetosRows(
                          org: index.toString(),
                          projID: index.toString(),
                          cpf: index.toString());
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),

                //Adicionar projetos
                GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      setState(() {
                        corContainer = const Color.fromARGB(255, 150, 183, 111);
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        corContainer = const Color.fromARGB(255, 175, 218, 126);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: corContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Icon(Icons.add_box_outlined)],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
