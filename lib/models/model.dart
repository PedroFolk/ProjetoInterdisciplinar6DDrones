import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelA extends ChangeNotifier {
  int _orgPage = -1;
  int get orgPage => _orgPage;

  int _orgId = 1;
  int get orgId => _orgId;

  int _orgIdSelector = 0;
  int get orgIdSelector => _orgIdSelector;

  bool _expand = false;
  bool get expand => _expand;

  final List<Map<String, dynamic>> _usuarios = [
    {
      // 'nome': 'd',
      // 'email': 'd',
      // 'celular': 'd',
      // 'organizacao': 'd',
    }
  ];
  List<Map<String, dynamic>> get usuarios => _usuarios;

  Future<Map<String, dynamic>> loginUser(
      String email, String senha, void mudarPagina) async {
    const apiUrl = 'http://127.0.0.1:8000/verificaLogin/';

    // Construct the URL with the email and password as query parameters
    final url = Uri.parse('$apiUrl?email=$email&senha=$senha');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        await getUserData(email); // Make sure to await if necessary
        mudarPagina; // Call the function to change the page
        notifyListeners(); // Notify listeners after making changes
        return {}; // Return appropriate data if needed
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }

  Future<Map<String, dynamic>> getUserData(String email) async {
    const apiUrl = 'http://127.0.0.1:8000/exibeInfo/';

    // Construct the URL with the email as a query parameter
    final url = Uri.parse('$apiUrl?email=$email');

    try {
      // Send a GET request to the server
      final response = await http.get(url);

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the response body as JSON
        var responseData = json.decode(response.body);

        // Add user data to a list (assuming _usuarios is a list field in your class)
        _usuarios.add({
          'nome': responseData['nome'],
          'email': responseData['email'],
          'celular': responseData['celular'],
          'organizacao': responseData['organizacao_nome'] ?? '',
        });
        notifyListeners();

        // Print response data
        print(usuarios[1]);
        print(responseData['nome']);

        // Return the response data
        return responseData;
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors during the HTTP request
      print('Error: $e');
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }

  Future<http.Response> createLoginUser(
    String nome,
    String email,
    String endereco,
    String senha,
    String celular,
  ) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/verifica_usuario_existe/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'email': email,
        'endereco': endereco,
        'senha': senha,
        'celular': celular,
      }),
    );
    print(response);
    criarUsuario(
      celular,
      email,
      celular,
      senha,
    );
    return response;
  }

  void criarUsuario(
    String nome,
    String email,
    String celular,
    String senha,
  ) {
    Map<String, dynamic> novoUsuario = {
      'nome': nome,
      'email': email,
      'celular': celular,
      'senha': senha,
    };
    _usuarios.add(novoUsuario);
    notifyListeners();
  }

  void zerarUsuarios() {
    _usuarios.removeLast();
    notifyListeners();
  }

  final List<Map<String, dynamic>> _organizacoes = [
    {
      'responsavel': 'Joao',
      'razao': 'Sei',
      'cpfCnpj': 'xxx.xxx.xxx-xx',
      'endereco': 'La longe',
      'id': '001',
      'projeto': 'Aquele la'
    },
    {
      'responsavel': 'Amanda C',
      'razao': 'Loius',
      'cpfCnpj': 'xx.xxx.xxx/xxxx-xx',
      'endereco': 'La longe',
      'id': '002',
      'projeto': 'Aquele la'
    },
  ];

  List<Map<String, dynamic>> get organizacoes => _organizacoes;

  void atualizaOrgs(
    int index,
    String reponsavel,
    String razao,
    String cpfCnpj,
    String endereco,
  ) {
    _organizacoes[index]['responsavel'] = reponsavel;
    _organizacoes[index]['razao'] = razao;
    _organizacoes[index]['cpfCnpj'] = cpfCnpj;
    _organizacoes[index]['endereco'] = endereco;
    notifyListeners();
  }

  bool _deletando = false;
  bool get deletando => _deletando;

  void toggleDeletando() {
    _deletando = !_deletando;
    notifyListeners();
  }

  void deletarOrg(index) {
    _organizacoes.removeAt(index);
    notifyListeners();
  }

  void incrementOrgId() {
    _orgId = _orgId + 1;
    notifyListeners();
  }

  void resetOrgId() {
    _orgId = 1;
    notifyListeners();
  }

  void setOrgIdSelector(index) {
    _orgIdSelector = index;
    notifyListeners();
  }

  void toggleExpand() {
    _expand = !_expand;
    notifyListeners();
  }

  void setPage(page) {
    _orgPage = page;
    notifyListeners();
  }

  Future<void> getFile() async {
    var getFile = FilePickerWeb.platform.pickFiles();
  }
}
