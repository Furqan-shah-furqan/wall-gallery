import 'package:flutter/material.dart';
import '../card_layout.dart';

class MoblileBody extends StatelessWidget {
  const MoblileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardLayout(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
  }
}
