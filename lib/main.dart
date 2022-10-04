import 'package:master_detail/master_detail_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master-Detail example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MasterDetailContainer(),
    );
  }
}