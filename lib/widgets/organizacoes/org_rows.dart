import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizacaoRow extends StatefulWidget {
  final String rz;
  final String cpfCnpj;
  final String id;
  final Function()? onTap;
  final int index;
  final bool deletando;
  const OrganizacaoRow({
    super.key,
    required this.rz,
    required this.cpfCnpj,
    required this.id,
    required this.onTap,
    required this.index,
    required this.deletando,
  });

  @override
  State<OrganizacaoRow> createState() => _OrganizacaoRowState();
}

class _OrganizacaoRowState extends State<OrganizacaoRow> {
  @override
  Widget build(BuildContext context) {
    final orgs = context.read<ModelA>();
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            corContainer = Colors.grey[400];
          });
        },
        onExit: (event) {
          setState(() {
            corContainer = Colors.grey[300];
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: orgs.deletando ? Colors.red : corContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                valorRazao(),
                valorCpfCnpj(),
                Text(
                  widget.id,
                  style: TextStyle(
                      fontSize: 18,
                      color: orgs.deletando ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText valorRazao() {
    final orgs = context.read<ModelA>();

    var texto = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 18.0,
          color: orgs.deletando ? Colors.white : Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: widget.rz),
          const TextSpan(
            text: "xx",
            style: TextStyle(color: Colors.transparent),
          ),
        ],
      ),
    );

    if (widget.rz.length < 5) {
      return texto;
    } else {
      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18.0,
            color: orgs.deletando ? Colors.white : Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: widget.rz.substring(0, 5)),
          ],
        ),
      );
    }
  }

  RichText valorCpfCnpj() {
    final orgs = context.read<ModelA>();

    var texto = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 18.0,
          color: orgs.deletando ? Colors.white : Colors.black,
        ),
        children: <TextSpan>[
          const TextSpan(
            text: "xx",
            style: TextStyle(color: Colors.transparent),
          ),
          TextSpan(text: widget.cpfCnpj),
          const TextSpan(
            text: "/x",
            style: TextStyle(color: Colors.transparent),
          ),
        ],
      ),
    );

    if (widget.cpfCnpj.length < 16) {
      return texto;
    } else {
      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18.0,
            color: orgs.deletando ? Colors.white : Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: widget.cpfCnpj),
          ],
        ),
      );
    }
  }
}
