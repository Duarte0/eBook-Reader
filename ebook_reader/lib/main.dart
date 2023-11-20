import 'package:ebook_reader/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'balta.io',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const WelcomePage(),
    );
  }
}