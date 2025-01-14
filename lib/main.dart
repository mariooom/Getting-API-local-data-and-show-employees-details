import 'package:flutter/material.dart';
import 'package:data_handel/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
