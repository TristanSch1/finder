import 'package:finder/data/bachelors.dart';
import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/bachelor_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class BachelorsMaster extends StatelessWidget {
  const BachelorsMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore bachelorsStore = Provider.of<BachelorsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bachelors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => context.go('/favorites'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: bachelorsStore.bachelors.length,
          itemBuilder: (BuildContext context, int index) {
            return BachelorPreview(bachelor: bachelorsStore.bachelors[index]);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
      ),
    );
  }
}