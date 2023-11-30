import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldsPerfil extends StatefulWidget {
  final double width;
  final TextEditingController? controller;
  final bool readOnly;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;

  const FieldsPerfil({
    super.key,
    required this.width,
    required this.controller,
    required this.readOnly,
    required this.enabled,
    this.inputFormatters,
  });

  @override
  State<FieldsPerfil> createState() => _FieldsPerfilState();
}

class _FieldsPerfilState extends State<FieldsPerfil> {
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
                  inputFormatters: widget.inputFormatters,
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
