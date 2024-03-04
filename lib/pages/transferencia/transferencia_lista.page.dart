import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../models/transferencia.model.dart';
import '../../models/transferencias.model.dart';
import '../../pages/transferencia/transferencia_form.page.dart';

const _tituloAppBar = 'Transferências';

class TransferenciaListaPage extends StatelessWidget {
  const TransferenciaListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: Consumer<TransferenciasModel>(builder: (context, model, child) {
        return ListView.builder(
          itemCount: model.transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = model.transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferenciaFormPage();
          }));
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final TransferenciaModel _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      ),
    );
  }
}
