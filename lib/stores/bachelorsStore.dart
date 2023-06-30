import 'package:finder/utils/gender.dart';
import 'package:mobx/mobx.dart';
import 'package:finder/data/bachelors.dart';
import 'package:finder/models/bachelor.dart';

// Include generated file
part 'bachelorsStore.g.dart';

class Filter {
  final String key;
  final String value;

  Filter({required this.key, required this.value});
}

enum GenderFilter { all, male, female }

abstract class _BachelorsStore with Store {
  final List<Bachelor> _bachelors = ObservableList.of(bachelorsList);

  @observable
  ObservableList<String> liked = ObservableList.of([]);

  @observable
  ObservableList<String> disliked = ObservableList.of([]);

  @observable
  GenderFilter genderFilter = GenderFilter.all;

  @observable
  String searchFilter = '';

  @action
  void toggleLike(String id) {
    if (disliked.contains(id)) {
      disliked.remove(id);
    }

    if (isLiked(id)) {
      liked.remove(id);
    } else {
      liked.add(id);
    }
  }

  @action
  void toggleDislike(String id) {
    if (liked.contains(id)) {
      liked.remove(id);
    }

    if (isDisliked(id)) {
      disliked.remove(id);
    } else {
      disliked.add(id);
    }
  }

  @action
  clearFilters() {
    genderFilter = GenderFilter.all;
    searchFilter = '';
  }

  @action
  clearLiked() {
    liked = ObservableList.of([]);
  }

  @computed
  List<Bachelor> get bachelors {
     List<Bachelor> filteredBachelors = _bachelors.where((Bachelor bachelor) {
       switch (genderFilter) {
         case GenderFilter.all:
           return true;
         case GenderFilter.male:
           return bachelor.gender == Gender.male;
         case GenderFilter.female:
           return bachelor.gender == Gender.female;
       }
     }).toList();
    filteredBachelors = filteredBachelors.where((Bachelor bachelor) {
      return !disliked.contains(bachelor.id);
    }).toList();

    filteredBachelors = filteredBachelors.where((Bachelor bachelor) {
      return bachelor.firstname.toLowerCase().contains(searchFilter.toLowerCase());
    }).toList();
    return filteredBachelors;
  }

  Bachelor getBachelor(String id) => bachelors.firstWhere((Bachelor bachelor) => bachelor.id == id);

  bool isLiked(String id) => liked.contains(id);
  bool isDisliked(String id) => disliked.contains(id);

  @computed
  List<Bachelor> get likedList => bachelors.where((Bachelor bachelor) => liked.contains(bachelor.id)).toList();
}

class BachelorsStore = _BachelorsStore with _$BachelorsStore;