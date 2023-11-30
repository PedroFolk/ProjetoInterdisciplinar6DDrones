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

  bool _usuarioCerto = true;
  bool get usuarioCerto => _usuarioCerto;

  final List<Map<String, dynamic>> _usuarios = [
    {
      'nome': 'nome',
      'email': 'eada',
      'celular': '(11) 968021409',
      'organizacao': 'dada'
    }
  ];
  List<Map<String, dynamic>> get usuarios => _usuarios;

  Future<Map<String, dynamic>> loginUser(String email, String senha) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/verificaLogin/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'senha': senha,
      }),
    );

    if (response.statusCode != 200) {
      // Handle error
      print("Error: ${response.statusCode}");
      return {'error': 'Failed to log in'};
    } else {
      _usuarioCerto = true;
      notifyListeners();
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Store responseData in _usuarios list
      _usuarios.add({
        'nome': responseData['nome'],
        'email': responseData['email'],
        'celular': responseData['celular'],
        'organizacao_nome': responseData['organizacao_nome'] ??
            '', // Use an empty string if key is not present
      });

      return responseData;
    }
  }

  Future<Map<String, dynamic>> getUserData(String email) async {
    final response = await http.get(
      Uri.parse(
          'http://127.0.0.1:8000/exibeInfo/?email=${Uri.encodeQueryComponent(email)}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      if (responseData.containsKey("nome")) {
        _usuarios.add({
          'nome': responseData["nome"],
          'email': responseData["email"],
          'celular': responseData["celular"],
          'organizacao': responseData["organizacao_nome"] ?? '',
        });

        notifyListeners();

        print(responseData);
        print(usuarios);
        return responseData;
      } else {
        // Handle case where 'nome' key is missing
        print("Error: 'nome' key not found in response");
        return {};
      }
    } else {
      // Handle non-200 status code
      print("Error: ${response.statusCode}");
      return {};
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
