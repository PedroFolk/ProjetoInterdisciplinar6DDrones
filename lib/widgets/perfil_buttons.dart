import 'package:c6_drones_app/consts/consts.dart';
import 'package:flutter/material.dart';

class PerfilButtons extends StatefulWidget {
  final bool editando;
  final Function funcEditar;
  final Function funcSalvar;
  final Function funcCancelar;
  const PerfilButtons({
    super.key,
    required this.editando,
    required this.funcEditar,
    required this.funcSalvar,
    required this.funcCancelar,
  });

  @override
  State<PerfilButtons> createState() => _PerfilButtonsState();
}

class _PerfilButtonsState extends State<PerfilButtons> {
  var corSalvar = blueC6;
  var corCancelar = blueC6;
  var corEditar = blueC6;

  @override
  Widget build(BuildContext context) {
    if (widget.editando == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.funcSalvar();
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  corSalvar = Colors.grey;
                });
              },
              onExit: (event) {
                setState(() {
                  corSalvar = blueC6;
                });
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: corSalvar),
                  borderRadius: BorderRadius.circular(10),
                  color: corSalvar,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Salvar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.funcCancelar();
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  corCancelar = Colors.grey;
                });
              },
              onExit: (event) {
                setState(() {
                  corCancelar = blueC6;
                });
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: corCancelar),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Cancelar",
                        style: TextStyle(
                          color: corCancelar,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      // Editar
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.funcEditar();
          });
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            setState(() {
              corEditar = Colors.grey;
            });
          },
          onExit: (event) {
            setState(() {
              corEditar = blueC6;
            });
          },
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: corEditar),
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.edit,
                    color: corEditar,
                  ),
                  Text(
                    "Editar Perfil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: corEditar,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
