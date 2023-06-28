import 'package:mobx/mobx.dart';
import 'package:finder/data/bachelors.dart';
import 'package:finder/models/bachelor.dart';

// Include generated file
part 'bachelorsStore.g.dart';

abstract class _BachelorsStore with Store {
  @observable
  ObservableList<Bachelor> bachelors = ObservableList.of(bachelorsList);

  @observable
  ObservableList<String> favorites = ObservableList.of([]);

  @action
  void addFavorite(String id) {
    favorites.add(id);
  }

  @action
  void removeFavorite(String id) {
    favorites.remove(id);
  }

  Bachelor getBachelor(String id) => bachelors.firstWhere((Bachelor bachelor) => bachelor.id == id);

  bool isFavorite(String id) => favorites.contains(id);

  @computed
  List<Bachelor> get favoritesList => bachelors.where((Bachelor bachelor) => favorites.contains(bachelor.id)).toList();
}

class BachelorsStore = _BachelorsStore with _$BachelorsStore;