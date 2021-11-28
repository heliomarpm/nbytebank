import 'package:flutter/material.dart';
import 'package:nbytebank/pages/dashboard/saldo_card.dart';
import 'package:nbytebank/pages/deposito/deposito_form.page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Bytebank'),
      ),
      body: ListView(children: [
        const Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(),
        ),
        ElevatedButton(
          child: const Text('Creditar'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DepositoFormPage(),
            ),
          ),
        ),
      ]),
    );
  }
}