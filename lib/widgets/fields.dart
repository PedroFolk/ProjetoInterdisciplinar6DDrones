import 'package:c6_drones_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fields extends StatefulWidget {
  final TextEditingController controller;
  final IconData icone;
  final bool isSenha;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? passwordIcon;

  const Fields({
    super.key,
    required this.controller,
    required this.icone,
    required this.isSenha,
    required this.validator,
    required this.labelText,
    required this.hintText,
    this.inputFormatters,
    this.passwordIcon,
  });

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  bool hasErro = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
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

        //Controller
        controller: widget.controller,

        //Formaters
        inputFormatters: widget.inputFormatters,

        //Texto
        style: const TextStyle(
          color: Colors.white,
        ),

        //Esconder input
        obscureText: widget.isSenha,

        //Decoration
        decoration: InputDecoration(
          //Icone anterior
          prefixIcon: Icon(
            widget.icone,
            color: hasErro ? corErroNome : corPadrao,
          ),

          //Borda ativa
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasErro ? corErroNome : corPadrao),
          ),

          //Borda Focada
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasErro ? corErroNome : corPadrao),
          ),

          //Borda de erro focada
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasErro ? corErroNome : corPadrao),
          ),

          //Borda de erro
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasErro ? corErroNome : corPadrao),
          ),

          //Estilo de texto do erro
          errorStyle: TextStyle(
            color: hasErro ? corErroNome : corPadrao,
            fontWeight: FontWeight.bold,
          ),

          //Texto que aparece incial
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: hasErro ? corErroNome : corPadrao,
          ),

          //Texto ao focar a barra
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: hasErro ? corErroNome : corPadrao,
          ),

          //Icone no final
          suffixIcon: widget.passwordIcon,

//
        ),
      ),
    );
  }
}
