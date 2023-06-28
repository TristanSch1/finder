import 'dart:math';

enum Gender {
  male,
  female
}

Gender randomGender() {
  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  int randomNumber = random(0, 1);

  if (randomNumber == 0) {
    return Gender.male;
  } else {
    return Gender.female;
  }
}