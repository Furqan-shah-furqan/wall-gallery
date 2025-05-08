import 'package:flutter/material.dart';
import '../card_layout.dart';

class LaptopBody extends StatelessWidget {
  const LaptopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardLayout(
      crossAxisCount: 5,
      mainAxisSpacing: 18,
      crossAxisSpacing: 12,
    );
  }
}
