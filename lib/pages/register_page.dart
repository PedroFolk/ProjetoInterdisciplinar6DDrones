import 'package:c6_drones_app/consts/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          //Lado esquerdo
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo,
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Revelamos o mundo,\ntransformando dados em visão!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      color: greyC6,
                    ),
                  )
                ],
              ),
            ),
          ),

          //Lado Direito
          Expanded(
            child: Container(
              color: blueC6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Registro texto
                  const Text(
                    "Registrar-se",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // Input nome
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Input email
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Input celular(com ddd)
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Input endereço
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Input senha
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Input confirmSenha
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                          hintText: 'exemplo@email.com',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          labelStyle: TextStyle(
                            color: Colors.grey[100],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Botão de cadastro
                  GestureDetector(
                    onTap: entrar,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          corBotao = greyC6;
                          corBotaoText = Colors.white;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          corBotao = Colors.white;
                          corBotaoText = blueC6;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: corBotao,
                        ),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: corBotaoText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //Divisor
                  Divider(
                    indent: 200,
                    endIndent: 200,
                    thickness: 1.5,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Ir para logar
                  GestureDetector(
                    onTap: goToRegister,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          registrarColor = greyC6;
                          registrarSize = 22.0;
                          registrarStyle = FontStyle.normal;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          registrarColor = Colors.white;
                          registrarSize = 18.0;
                          registrarStyle = FontStyle.italic;
                        });
                      },
                      child: Text(
                        "Registrar-se",
                        style: TextStyle(
                          color: registrarColor,
                          fontSize: registrarSize,
                          fontStyle: registrarStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Função para ir para pagina de registro
  void goToRegister() {}

// Função para ir para pagina de esqueci senha
  void forgotPassword() {}

// Função entrar
  void entrar() {
    cleanControllers();
  }

  void cleanControllers() {
    emailController.text = '';
    passwordController.text = '';
  }
}
