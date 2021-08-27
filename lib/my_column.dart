import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final String? gender;
  final IconData? customIcon;
  final Color customColor;
  MyColumn(
      {this.gender = "NULL",
      this.customIcon = Icons.add_alert_outlined,
      this.customColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          customIcon,
          size: 50,
          color: customColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender!,
          style: TextStyle(
              color: customColor, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
