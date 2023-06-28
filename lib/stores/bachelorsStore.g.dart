// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bachelorsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BachelorsStore on _BachelorsStore, Store {
  Computed<List<Bachelor>>? _$favoritesListComputed;

  @override
  List<Bachelor> get favoritesList => (_$favoritesListComputed ??=
          Computed<List<Bachelor>>(() => super.favoritesList,
              name: '_BachelorsStore.favoritesList'))
      .value;

  late final _$bachelorsAtom =
      Atom(name: '_BachelorsStore.bachelors', context: context);

  @override
  ObservableList<Bachelor> get bachelors {
    _$bachelorsAtom.reportRead();
    return super.bachelors;
  }

  @override
  set bachelors(ObservableList<Bachelor> value) {
    _$bachelorsAtom.reportWrite(value, super.bachelors, () {
      super.bachelors = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: '_BachelorsStore.favorites', context: context);

  @override
  ObservableList<String> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<String> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_BachelorsStoreActionController =
      ActionController(name: '_BachelorsStore', context: context);

  @override
  void addFavorite(String id) {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.addFavorite');
    try {
      return super.addFavorite(id);
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavorite(String id) {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.removeFavorite');
    try {
      return super.removeFavorite(id);
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bachelors: ${bachelors},
favorites: ${favorites},
favoritesList: ${favoritesList}
    ''';
  }
}
