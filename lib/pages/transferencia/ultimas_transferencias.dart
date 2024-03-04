import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transferencias.model.dart';
import '../../pages/transferencia/transferencia_lista.page.dart';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Últimas Transferências",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Consumer<TransferenciasModel>(
        builder: (context, model, child) {
          final transferencias = model.transferencias.reversed.toList();
          final int iCount = math.min(2, transferencias.length);

          if (iCount == 0) {
            return const SemTransferencias();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: iCount,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemTransferencia(transferencias[index]);
            },
          );
        },
      ),
      ElevatedButton(
        child: const Text('Lista de Transferências'),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TransferenciaListaPage(),
          ),
        ),
      ),
    ]);
  }
}

class SemTransferencias extends StatelessWidget {
  const SemTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.all(40),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Nenhuma transferência realizada... 😊',
            textAlign: TextAlign.center,
          ),
        ));
  }
}
