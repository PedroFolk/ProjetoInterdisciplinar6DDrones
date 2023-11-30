import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/widgets/organizacoes/org_cadastro.dart';
import 'package:c6_drones_app/widgets/organizacoes/org_inicial.dart';
import 'package:c6_drones_app/widgets/organizacoes/org_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Organizacoes extends StatefulWidget {
  const Organizacoes({super.key});

  @override
  State<Organizacoes> createState() => _OrganizacoesState();
}

class _OrganizacoesState extends State<Organizacoes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelA>(
        builder: (context, value, child) => Container(
              color: blueC6,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildPage(value),
                  ),
                ),
              ),
            ));
  }

  Widget _buildPage(ModelA model) {
    final orgs = context.read<ModelA>();

    final a = model.orgPage;
    final orgId = model.orgIdSelector;

    switch (a) {
      case -1:
        return const OrgPagInicial();
      case 0:
        return OrgModelPage(
          responsavel: orgs.organizacoes[orgId]['responsavel'].toString(),
          razaoOuNome: orgs.organizacoes[orgId]['razao'].toString(),
          cpfCnpj: orgs.organizacoes[orgId]['cpfCnpj'].toString(),
          endereco: orgs.organizacoes[orgId]['endereco'].toString(),
          projeto: orgs.organizacoes[orgId]['projeto'].toString(),
          idOrg: orgs.organizacoes[orgId]['id'].toString(),
        );
      case 1:
        return const OrgCadastros();
      default:
        return const SizedBox(); // Return an empty SizedBox for other cases
    }
  }
}
