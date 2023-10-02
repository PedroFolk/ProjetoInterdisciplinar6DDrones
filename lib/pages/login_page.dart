import 'package:c6_drones_app/consts/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _passwordVisibility;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisibility = false;
    super.initState();
  }

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
                  //Login texto
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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

                  // Input Senha
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: !_passwordVisibility,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Colors.white,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey[100],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisibility = !_passwordVisibility;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Esqueci minha senha
                  SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: forgotPassword,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (event) {
                              setState(() {
                                corEsqueciSenha = greyC6;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                corEsqueciSenha = Colors.white;
                              });
                            },
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: corEsqueciSenha,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // Botão de entrar
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

                  // Registrar-se
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
