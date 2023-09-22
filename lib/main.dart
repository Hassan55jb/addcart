import 'package:addcart/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AddCart());
}

class AddCart extends StatelessWidget {
  const AddCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
