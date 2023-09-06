import 'package:flutter/material.dart';
import 'package:video/Video_Call/Index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IndexPage(),
    );
  }
}

