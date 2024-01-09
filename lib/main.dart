import 'package:class_statement/riverpod/s_home_4.dart';
import 'package:flutter/material.dart';

import 'inherited_widget/s_home_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen4(),
    );
  }
}


