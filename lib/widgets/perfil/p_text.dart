import 'package:c6_drones_app/consts/consts.dart';
import 'package:flutter/material.dart';

class TextPerfil extends StatelessWidget {
  final String nomeValor;
  const TextPerfil({super.key, required this.nomeValor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            '${nomeValor.capitalize()}:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
