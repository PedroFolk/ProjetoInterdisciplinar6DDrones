import 'package:flutter/material.dart';

const blueC6 = Color.fromRGBO(78, 124, 191, 1);
const lightBlueC6 = Color.fromRGBO(86, 135, 209, 1);
const greyC6 = Color.fromRGBO(178, 178, 178, 1);

var corEsqueciSenha = Colors.white;
var corBotao = Colors.white;
var corBotaoText = blueC6;

var logo = Image.asset('imgs/Logo.png');

var perfilImg = Image.asset(
  'imgs/Perfil.png',
  height: 400,
);

var registrarColor = Colors.white;
var registrarSize = 18.0;
var registrarStyle = FontStyle.italic;

var corPadrao = Colors.white;

var corErroNome = Colors.red;

var corGrayFieldPerfil = const Color.fromRGBO(217, 217, 217, 0.3);

var corDeFundoPerfil = const Color.fromRGBO(255, 255, 255, 0.9);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

var corContainer = Colors.grey[300];
