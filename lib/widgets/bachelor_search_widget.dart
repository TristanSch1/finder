import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/bachelor_reset_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BachelorSearch extends StatelessWidget {
  const BachelorSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);
    final TextEditingController _controller = TextEditingController(text: store.searchFilter);
    return Observer(
      builder: (_) => TextField(
        decoration: const InputDecoration(
          hintText: 'Rechercher un bachelor',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (String value) {
          store.searchFilter = value;
        },
        controller: _controller,

      ),
    );
  }
}