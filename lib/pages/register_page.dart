import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/pages/login_page.dart';
import 'package:c6_drones_app/pages/main_page.dart';
import 'package:c6_drones_app/widgets/fields.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  set hasErro(bool hasErro) {}

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late bool _passwordVisibility;

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final celularController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void initState() {
    _passwordVisibility = false;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nomeController.dispose();
    emailController.dispose();
    celularController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
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
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  children: [
                    Column(
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

                        //Espaco
                        const SizedBox(
                          height: 50,
                        ),

                        //Input nome
                        Fields(
                          controller: nomeController,
                          icone: Icons.account_circle_outlined,
                          isSenha: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "erro";
                            } else {}
                            return null;
                          },
                          labelText: 'Nome Completo',
                          hintText: 'Digite seu nome completo',
                        ),

                        //Espaco
                        const SizedBox(
                          height: 25,
                        ),

                        // Input email
                        Fields(
                          controller: emailController,
                          icone: Icons.email_outlined,
                          isSenha: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !EmailValidator.validate(
                                    emailController.text)) {
                              return "Por favor insira um email valido";
                            }
                            return null;
                          },
                          labelText: "Email",
                          hintText: "exemplo@email.com",
                        ),

                        //Espaço
                        const SizedBox(
                          height: 25,
                        ),

                        // Input celular(com ddd)
                        Fields(
                          controller: celularController,
                          icone: Icons.phone_android_outlined,
                          isSenha: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                celularController.text.length < 11) {
                              return "Por favor insira um celular valido";
                            }
                          },
                          labelText: 'celular',
                          inputFormatters: [celularMask],
                          hintText: '(11) XXXXX-XXXX',
                        ),

                        // Espaco
                        const SizedBox(
                          height: 25,
                        ),

                        // Input senha
                        Fields(
                          controller: passwordController,
                          icone: Icons.lock_outline,
                          isSenha: !_passwordVisibility,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor insira uma senha valida";
                            }
                            if (value.length < 8 ||
                                !value.contains(RegExp(r'[0-9]')) ||
                                !value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return "Sua senha deve conter no minimo:\n8 caracteres\n1 numero\n1 caracter especial ";
                            }
                            return null;
                          },
                          passwordIcon: IconButton(
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
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
                        ),

                        //Espaco
                        const SizedBox(
                          height: 15,
                        ),

                        // Input confirmSenha
                        Fields(
                          controller: passwordConfirmController,
                          icone: Icons.lock_outline,
                          isSenha: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor insira uma senha valida";
                            }
                            if (passwordController.text !=
                                passwordConfirmController.text) {
                              return "As senhas tem que ser iguais";
                            }
                            return null;
                          },
                          labelText: 'Confirme Senha',
                          hintText: 'Digite sua senha',
                        ),

                        //Espaco
                        const SizedBox(
                          height: 25,
                        ),

                        // Botão de cadastro
                        GestureDetector(
                          onTap: registrar,
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
                          onTap: goToLogin,
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
                              "Já possui conta? clique aqui!",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Função para ir para pagina de registro
  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => const LoginPage()),
      ),
    );
  }

// Função entrar
  void registrar() {
    if (_formKey.currentState!.validate()) {
      enviarAPI();
      cleanControllers();
    } else {
      print("Deu errado algo");
    }
  }

  void enviarAPI() {
    final users = context.read<ModelA>();
    users.createLoginUser(
      nomeController.text,
      emailController.text,
      "",
      passwordController.text,
      celularController.text,
    );
    // users.criarUsuario(
    //   nomeController.text,
    //   emailController.text,
    //   celularSoNumero,
    //   passwordController.text,
    // );
    // print(users.usuarios);
    // users.zerarUsuarios();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => const MainPage()),
      ),
    );
  }

  void cleanControllers() {
    nomeController.text = '';
    emailController.text = '';
    celularController.text = '';
    passwordController.text = '';
    passwordConfirmController.text = '';
  }

  var celularMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  late var celularSoNumero = celularMask.getUnmaskedText();
  late var celularFormatado = celularMask.getMaskedText();
}
