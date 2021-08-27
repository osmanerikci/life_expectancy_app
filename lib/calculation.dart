import 'package:life_expectancy_app/user_data.dart';

class Calculation {
  UserData _userData;
  Calculation(this._userData);

  String calculate() {
    double? result;

    result = 90 + (_userData.sliderValueGym)! - (_userData.sliderValueSmoke)!;
    result = result + (_userData.personHeight)! / (_userData.personWeight)!;

    if (_userData.selectedGender == "KADIN") {
      result += 5;
    }
    return result.toStringAsFixed(0);
  }
}
