import 'package:finder/utils/gender.dart';

class Bachelor {
  String id;
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;

  Bachelor(this.id, this.firstname, this.lastname, this.gender, this.avatar, this.searchFor, this.job, this.description);

  String getPropertyValue(String key) {
    switch(key) {
      case 'firstname':
        return firstname;
      case 'lastname':
        return lastname;
      case 'gender':
        return gender.name;
      case 'job':
        return job!;
      case 'description':
        return description!;
      default:
        return '';
    }
  }
}