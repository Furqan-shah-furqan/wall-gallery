import 'package:flutter/material.dart';
import '../card_layout.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardLayout(
      crossAxisCount: 7,
      mainAxisSpacing: 22,
      crossAxisSpacing: 15,
    );
  }
}
