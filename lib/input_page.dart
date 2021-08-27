import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy_app/result_page.dart';
import 'package:life_expectancy_app/user_data.dart';

import 'my_column.dart';
import 'my_container.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = "";
  double sliderValueSmoke = 0;
  double sliderValueGym = 0;
  int personHeight = 170;
  int personWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Life Expectancy',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedBox("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedBox("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gym Sayısı"),
                  Text(sliderValueGym.round().toString()),
                  Slider(
                      min: 0,
                      max: 7,
                      value: sliderValueGym,
                      onChanged: (double newValue) {
                        setState(() {
                          sliderValueGym = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sigara Sayısı"),
                  Text(sliderValueSmoke.round().toString()),
                  Slider(
                      min: 0,
                      max: 30,
                      value: sliderValueSmoke,
                      onChanged: (double newValue) {
                        setState(() {
                          sliderValueSmoke = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    customColor: selectedGender == "KADIN"
                        ? Colors.orangeAccent
                        : Colors.white,
                    onPress: () {
                      setState(() {
                        selectedGender = "KADIN";
                        print(selectedGender);
                      });
                    },
                    child: MyColumn(
                      gender: "KADIN",
                      customIcon: FontAwesomeIcons.venus,
                      customColor: Colors.pinkAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    customColor: selectedGender == "ERKEK"
                        ? Colors.orangeAccent
                        : Colors.white,
                    onPress: () {
                      setState(() {
                        selectedGender = "ERKEK";
                      });
                    },
                    child: MyColumn(
                      gender: "ERKEK",
                      customIcon: FontAwesomeIcons.mars,
                      customColor: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                                personWeight: personWeight,
                                personHeight: personHeight,
                                sliderValueGym: sliderValueGym,
                                sliderValueSmoke: sliderValueSmoke,
                                selectedGender: selectedGender,
                              ))));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.skullCrossbones),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "When will you die?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Row buildRowOutlinedBox(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Container(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Container(
            child: Text(
              label == "BOY"
                  ? personHeight.toString()
                  : personWeight.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        label == "BOY" ? ++personHeight : ++personWeight;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        label == "BOY" ? --personHeight : --personWeight;
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
