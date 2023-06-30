import 'package:finder/stores/bachelorsStore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetFilter extends StatelessWidget {
  const ResetFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);
    return IconButton(
        onPressed: () {
          store.clearFilters();
        },
        icon: const Icon(Icons.filter_alt_off_outlined)
    );
  }
}