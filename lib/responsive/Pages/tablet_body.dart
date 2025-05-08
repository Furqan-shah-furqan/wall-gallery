import 'package:flutter/material.dart';
import '../card_layout.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardLayout(
      crossAxisCount: 3,
      mainAxisSpacing: 14,
      crossAxisSpacing: 8,
    );
  }
}
