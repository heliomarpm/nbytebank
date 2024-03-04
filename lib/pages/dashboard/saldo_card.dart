import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.model.dart';

class SaldoCard extends StatelessWidget {

  const SaldoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<SaldoModel>(
          builder: (context, model, child) {
            return Text(
              model.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
