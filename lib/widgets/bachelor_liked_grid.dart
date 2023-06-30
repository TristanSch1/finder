import 'package:finder/models/bachelor.dart';
import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LikedGrid extends StatelessWidget {
  const LikedGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);
    return Observer(
      builder: (_) =>
          GridView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: store.liked.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Nombre de colonnes dans la grille
              mainAxisSpacing: 8.0, // Espacement vertical entre les éléments
              crossAxisSpacing: 8.0, // Espacement horizontal entre les éléments
            ),
            itemBuilder: (BuildContext context, int index) {
              Bachelor bachelor = store.bachelors.firstWhere((
                  element) => element.id == store.liked[index]);
              return Observer(
                builder: (_) => Dismissible(
                    key: Key(bachelor.id),
                    onDismissed: (direction) {
                      store.toggleLike(store.liked[index]);
                    },
                    background: Container(color: Colors.red.shade200),
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.black45,
                        title: Text(bachelor.firstname),
                        subtitle: Text(bachelor.lastname),
                      ),
                      child: Image.asset(bachelor.avatar, fit: BoxFit.contain),
                    ),
                )
              );
            },
          ),
    );
  }
}