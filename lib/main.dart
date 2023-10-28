import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/approute.dart';
import 'package:flutter_application_4/page/home.dart';
// import 'package:flutter_application_3/config/approute.dart';
// import 'package:flutter_application_3/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoute().routeAll,
      home: HomePage()
    );
  }
}

