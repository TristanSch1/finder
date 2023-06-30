import 'package:finder/models/bachelor.dart';
import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LikedList extends StatelessWidget {
  const LikedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);
    return Observer(
        builder: (_) => ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: store.liked.length,
          itemBuilder: (BuildContext context, int index) {
            Bachelor bachelor = store.bachelors.firstWhere((element) => element.id == store.liked[index]);
            return Observer(
              builder: (_) => Dismissible(
                  key: Key(bachelor.id),
                  onDismissed: (direction) {
                    store.toggleLike(store.liked[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${bachelor.firstname} ${bachelor.lastname} a été supprimé de vos likes")));
                  },
                  background: Container(color: Colors.red.shade200),
                  child: ListTile(
                    title: Text(bachelor.firstname),
                    subtitle: Text(bachelor.lastname),
                    leading: Avatar(imagePath: bachelor.avatar, width: 64, height: 64),
                    onTap: () {
                      context.push("/bachelor/${store.liked[index]}");
                    },
                  ),
              )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
    );
  }
}