import 'package:flutter/material.dart';
import 'package:life_expectancy_app/calculation.dart';
import 'package:life_expectancy_app/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result Page"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    "Expected Lifetime:${Calculation(_userData).calculate().toString()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
                flex: 1,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ));
  }
}
