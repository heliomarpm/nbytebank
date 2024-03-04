import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.model.dart';
import '../../models/transferencia.model.dart';
import '../../models/transferencias.model.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class TransferenciaFormPage extends StatelessWidget {
  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  TransferenciaFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                _controladorCampoValor,
                dica: _dicaCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: const Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final valor = double.tryParse(_controladorCampoValor.text);

    if (_validaTransferencia(context, numeroConta, valor)) {
      final transferencia = TransferenciaModel(valor!, numeroConta!);

      _atualizaState(context, transferencia);

      Navigator.pop(context, transferencia);
    }
  }

  bool _validaTransferencia(
    BuildContext context,
    int? numeroConta,
    double? valor,
  ) {
    return numeroConta != null &&
        valor != null &&
        Provider.of<SaldoModel>(context, listen: false).valor >= valor;
  }

  void _atualizaState(BuildContext context, TransferenciaModel transferencia) {
    Provider.of<SaldoModel>(context, listen: false).sacar(transferencia.valor);
    Provider.of<TransferenciasModel>(context, listen: false).add(transferencia);
  }
}
