import 'package:flutter/cupertino.dart';

import 'transferencia.model.dart';

class TransferenciasModel extends ChangeNotifier {
  
  final List<TransferenciaModel> _transferencias = [];

  get transferencias => _transferencias;

  void add(TransferenciaModel transferencia) {
    _transferencias.add(transferencia);
    notifyListeners();
  }
}