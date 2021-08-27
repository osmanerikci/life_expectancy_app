import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color customColor;
  final Widget? child;
  final Function()? onPress;
  MyContainer({this.customColor = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: customColor,
        ),
      ),
      onTap: onPress,
    );
  }
}
