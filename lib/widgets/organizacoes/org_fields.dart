import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldsOrg extends StatefulWidget {
  final double width;
  final TextEditingController? controller;
  final bool readOnly;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const FieldsOrg({
    super.key,
    required this.width,
    required this.controller,
    required this.readOnly,
    required this.enabled,
    this.inputFormatters,
    this.validator,
  });

  @override
  State<FieldsOrg> createState() => _FieldsOrgState();
}

class _FieldsOrgState extends State<FieldsOrg> {
  bool hasErro = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: widget.width,
              child: Padding(
                padding: EdgeInsets.all(hasErro ? 0.0 : 8.0),
                child: TextFormField(
                  //validar
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    setState(() {
                      hasErro = error != null;
                      // Atualiza o estado de erro com base na validação
                    });
                    return error;
                  },
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
      ],
    );
  }
}
