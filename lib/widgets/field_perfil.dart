import 'package:flutter/material.dart';

class FieldsPerfil extends StatefulWidget {
  final String valor;
  final double width;
  final TextEditingController? controller;
  final bool readOnly;
  final bool enabled;

  const FieldsPerfil({
    super.key,
    required this.valor,
    required this.width,
    required this.controller,
    required this.readOnly,
    required this.enabled,
  });

  @override
  State<FieldsPerfil> createState() => _FieldsPerfilState();
}

class _FieldsPerfilState extends State<FieldsPerfil> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text = widget.valor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  readOnly: widget.readOnly,
                  enabled: widget.enabled,
                  controller: widget.controller,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
