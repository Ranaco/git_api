import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API handling in flutter',
      home: HomePage(title: 'Parse JSON data'),
    );
  }
}
