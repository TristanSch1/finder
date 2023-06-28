import 'package:faker/faker.dart';
import 'package:finder/constants/avatars.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/utils/gender.dart';
import 'package:finder/constants/firstnames.dart';

List<Bachelor> generateBachelors () {
  List<Bachelor> bachelors = [];
  Faker faker = Faker();
  for (int i = 0; i < mensAvatars.length; i++ ){
    bachelors.add(
        Bachelor(
            faker.guid.guid(),
            mensFirstnames[faker.randomGenerator.integer(mensFirstnames.length - 1)],
            faker.person.lastName(),
            randomGender(),
            mensAvatars[i],
            [Gender.female],
            faker.job.title(),
            faker.lorem.sentences(faker.randomGenerator.integer(3, min: 1)).join(' ')
        )
    );
  }

  for (int i = 0; i < womensAvatars.length; i++ ) {
    bachelors.add(
        Bachelor(
            faker.guid.guid(),
            womensFirstnames[faker.randomGenerator.integer(womensFirstnames.length - 1)],
            faker.person.lastName(),
            randomGender(),
            womensAvatars[i],
            [Gender.female],
            faker.job.title(),
            faker.lorem.sentences(faker.randomGenerator.integer(3, min: 1)).join(' ')
        )
    );
  }
  bachelors.shuffle();

  return bachelors;
}

List<Bachelor> bachelorsList = generateBachelors();