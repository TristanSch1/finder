import 'package:finder/dart/drawer.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/avatar_widget.dart';
import 'package:finder/widgets/bachelor_liked_grid.dart';
import 'package:finder/widgets/bachelor_liked_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


enum DisplayMode {
  list,
  grid,
}

class BachelorFavorites extends StatefulWidget {
  const BachelorFavorites({Key? key}) : super(key: key);

  @override
  State<BachelorFavorites> createState() => _BachelorFavorites();
}

class _BachelorFavorites extends State<BachelorFavorites> {
  DisplayMode displayMode = DisplayMode.list;

  @override
  Widget build(BuildContext context) {
    final BachelorsStore store = Provider.of<BachelorsStore>(context);

    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
            title: const Text('Favorites'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => context.go("/"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: store.clearLiked,
              ),
            ],
        ),
        body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () => setState(() => displayMode = DisplayMode.list),
                    color: displayMode == DisplayMode.list ? Colors.teal : Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.grid_on),
                    onPressed: () => setState(() => displayMode = DisplayMode.grid),
                    color: displayMode == DisplayMode.grid ? Colors.teal : Colors.grey,
                  ),
                ],
              ),
              Expanded(
                child: displayMode == DisplayMode.list ? const LikedList() : const LikedGrid()
              ),
            ],
        )
      ),
    );
  }
}