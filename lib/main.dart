import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/saldo.model.dart';
import 'models/transferencias.model.dart';
import 'pages/dashboard/dashboard.page.dart';


void main() {
  runApp(DevicePreview(
    builder: (context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SaldoModel(0)),
      ChangeNotifierProvider(create: (context) => TransferenciasModel()),
    ],
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New ByteBank',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        // primaryColor: Colors.green[900],
        // accentColor: Colors.blueAccent[700],
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Colors.blueAccent[700],
        //   textTheme: ButtonTextTheme.primary,
        // ),
        primarySwatch: Colors.green,
      ),
      home: const DashboardPage(),
    );
  }
}
