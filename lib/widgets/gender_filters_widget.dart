import 'package:finder/stores/bachelorsStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GenderFilters extends StatelessWidget {
  const GenderFilters({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);

    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          RadioListTile(
            dense: true,
            title: const Text('Tous'),
            value: GenderFilter.all,
            groupValue: store.genderFilter,
            onChanged: (GenderFilter? value) {
              store.genderFilter = value!;
            },
          ),
          RadioListTile(
            dense: true,
            title: const Text('Hommes'),
            value: GenderFilter.male,
            groupValue: store.genderFilter,
            onChanged: (GenderFilter? value) {
              store.genderFilter = value!;
            },
          ),
          RadioListTile(
            dense: true,
            title: const Text('Femmes'),
            value: GenderFilter.female,
            groupValue: store.genderFilter,
            onChanged: (GenderFilter? value) {
              store.genderFilter = value!;
            },
          ),
        ],
      ),
    );
  }
}