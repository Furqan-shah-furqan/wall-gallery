import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.laptop,
      required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget laptop;
  final Widget desktop;
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth < 400 ){
        return mobile;
      }
      else if(constraints.maxWidth < 700){
        return tablet;
      }
      else if(constraints.maxWidth <1200){
        return laptop;
      }
      else {
        return desktop;
      }
    },);
  }
}
