import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/bachelor_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BachelorsList extends StatelessWidget {
  const BachelorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);

    return Expanded(
      child: Observer(
          builder: (_) => ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: store.bachelors.length,
            itemBuilder: (BuildContext context, int index) {
              return Observer(
                builder: (_) => BachelorPreview(bachelor: store.bachelors[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          )
      ),
    );
  }
}