import 'package:c6_drones_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TituloPags extends StatefulWidget {
  final String titulo;
  const TituloPags({super.key, required this.titulo});

  @override
  State<TituloPags> createState() => _TituloPagsState();
}

class _TituloPagsState extends State<TituloPags> {
  @override
  Widget build(BuildContext context) {
    return //Titulo da pagina
        Consumer<ModelA>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                final toggle = context.read<ModelA>();

                toggle.toggleExpand();
              },
              // child: Icon(Icons.open_with_rounded),
              child: value.expand
                  ? Icon(Icons.close_fullscreen_outlined)
                  : Icon(Icons.open_in_full_outlined),
            ),
          )
        ],
      ),
    );
  }
}
