// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bachelorsStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BachelorsStore on _BachelorsStore, Store {
  Computed<List<Bachelor>>? _$bachelorsComputed;

  @override
  List<Bachelor> get bachelors =>
      (_$bachelorsComputed ??= Computed<List<Bachelor>>(() => super.bachelors,
              name: '_BachelorsStore.bachelors'))
          .value;
  Computed<List<Bachelor>>? _$likedListComputed;

  @override
  List<Bachelor> get likedList =>
      (_$likedListComputed ??= Computed<List<Bachelor>>(() => super.likedList,
              name: '_BachelorsStore.likedList'))
          .value;

  late final _$likedAtom =
      Atom(name: '_BachelorsStore.liked', context: context);

  @override
  ObservableList<String> get liked {
    _$likedAtom.reportRead();
    return super.liked;
  }

  @override
  set liked(ObservableList<String> value) {
    _$likedAtom.reportWrite(value, super.liked, () {
      super.liked = value;
    });
  }

  late final _$dislikedAtom =
      Atom(name: '_BachelorsStore.disliked', context: context);

  @override
  ObservableList<String> get disliked {
    _$dislikedAtom.reportRead();
    return super.disliked;
  }

  @override
  set disliked(ObservableList<String> value) {
    _$dislikedAtom.reportWrite(value, super.disliked, () {
      super.disliked = value;
    });
  }

  late final _$genderFilterAtom =
      Atom(name: '_BachelorsStore.genderFilter', context: context);

  @override
  GenderFilter get genderFilter {
    _$genderFilterAtom.reportRead();
    return super.genderFilter;
  }

  @override
  set genderFilter(GenderFilter value) {
    _$genderFilterAtom.reportWrite(value, super.genderFilter, () {
      super.genderFilter = value;
    });
  }

  late final _$searchFilterAtom =
      Atom(name: '_BachelorsStore.searchFilter', context: context);

  @override
  String get searchFilter {
    _$searchFilterAtom.reportRead();
    return super.searchFilter;
  }

  @override
  set searchFilter(String value) {
    _$searchFilterAtom.reportWrite(value, super.searchFilter, () {
      super.searchFilter = value;
    });
  }

  late final _$_BachelorsStoreActionController =
      ActionController(name: '_BachelorsStore', context: context);

  @override
  void toggleLike(String id) {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.toggleLike');
    try {
      return super.toggleLike(id);
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDislike(String id) {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.toggleDislike');
    try {
      return super.toggleDislike(id);
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFilters() {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearLiked() {
    final _$actionInfo = _$_BachelorsStoreActionController.startAction(
        name: '_BachelorsStore.clearLiked');
    try {
      return super.clearLiked();
    } finally {
      _$_BachelorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
liked: ${liked},
disliked: ${disliked},
genderFilter: ${genderFilter},
searchFilter: ${searchFilter},
bachelors: ${bachelors},
likedList: ${likedList}
    ''';
  }
}
