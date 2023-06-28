import 'package:finder/stores/bachelorsStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class BachelorFavorites extends StatelessWidget {
  const BachelorFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore bachelorsStore = Provider.of<BachelorsStore>(context);
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
            title: const Text('Favorites'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => context.go("/"),
            ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: bachelorsStore.favorites.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(bachelorsStore.bachelors.firstWhere((element) => element.id == bachelorsStore.favorites[index]).firstname),
              subtitle: Text(bachelorsStore.bachelors.firstWhere((element) => element.id == bachelorsStore.favorites[index]).lastname),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(bachelorsStore.bachelors.firstWhere((element) => element.id == bachelorsStore.favorites[index]).avatar),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  bachelorsStore.removeFavorite(bachelorsStore.favorites[index]);
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      )
    );
  }
}