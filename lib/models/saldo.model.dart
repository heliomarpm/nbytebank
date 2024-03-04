
import 'package:flutter/material.dart';

class SaldoModel extends ChangeNotifier{
  double valor;
  
  SaldoModel(
    this.valor,
  );
  
  @override
  String toString() => 'R\$ $valor';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SaldoModel &&
      other.valor == valor;
  }

  @override
  int get hashCode => valor.hashCode;

  void creditar(double valor){
    this.valor += valor;
    notifyListeners();
  }

  void sacar(double valor){
    this.valor -= valor;
    notifyListeners();
  }
}
