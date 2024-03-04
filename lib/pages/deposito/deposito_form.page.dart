import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.model.dart';

const _title = 'Efetuar depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Depositar';

class DepositoFormPage extends StatelessWidget {
  final _controladorCampoValor = TextEditingController();

  DepositoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                _controladorCampoValor,
                dica: _dicaCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: const Text(_textoBotaoConfirmar),
                onPressed: () => _depositarSaldo(context),
              ),
            ],
          ),
        ));
  }

  void _depositarSaldo(BuildContext context) {
    final saldo = double.tryParse(_controladorCampoValor.text);

    if (saldo != null) {
      _atualizaState(context, saldo);

      Navigator.pop(context, saldo);
    }
  }

  void _atualizaState(BuildContext context, double valor) {
    // Dessa forma, esse componente não é atualizado a cada 
    // mudança do estado, utilizando apenas um método da classe.
    Provider.of<SaldoModel>(context, listen: false).creditar(valor);
  }
  
}
