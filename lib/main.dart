import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/pages/login_page.dart';
import 'package:c6_drones_app/pages/main_page.dart';
import 'package:c6_drones_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ModelA(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
