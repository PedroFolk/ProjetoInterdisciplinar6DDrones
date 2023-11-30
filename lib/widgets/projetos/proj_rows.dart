import 'package:flutter/material.dart';

class ProjetosRows extends StatefulWidget {
  final String org;
  final String projID;
  final String cpf;
  const ProjetosRows({
    super.key,
    required this.org,
    required this.projID,
    required this.cpf,
  });

  @override
  State<ProjetosRows> createState() => _ProjetosRowsState();
}

class _ProjetosRowsState extends State<ProjetosRows> {
  var corContainer = Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            color: corContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.org,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  widget.projID,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  widget.cpf,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
