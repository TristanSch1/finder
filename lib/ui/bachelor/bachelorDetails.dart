import 'package:finder/models/bachelor.dart';
import 'package:finder/stores/bachelorsStore.dart';
import 'package:finder/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class BachelorDetails extends StatelessWidget {
  const BachelorDetails({Key? key, required this.bachelorId}) : super(key: key);

  final String bachelorId;

  @override
  Widget build(BuildContext context) {
    final BachelorsStore bachelorsStore = Provider.of<BachelorsStore>(context);

    final Bachelor bachelor = bachelorsStore.getBachelor(bachelorId);

    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('${bachelor.firstname} ${bachelor.lastname}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => context.pop(),
          )
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Avatar(imagePath: bachelor.avatar, width: 128, height: 128),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        bachelorsStore.toggleDislike(bachelor.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(bachelorsStore.disliked.contains(bachelor.id) ? 'Added to unliked' : 'Removed from unliked'),
                            backgroundColor: Theme.of(context).primaryColor
                            ),
                        );

                        if (bachelorsStore.disliked.contains(bachelor.id)) {
                          context.go("/");
                        }
                      },
                      icon: bachelorsStore.disliked.contains(bachelor.id) ?
                      const Icon(
                          Icons.thumb_down_alt,
                          color: Colors.red,
                          size: 24
                      ) :
                      const Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Colors.grey,
                          size: 24
                      )
                  ),
                  IconButton(
                      onPressed: () {
                        bachelorsStore.toggleLike(bachelor.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(bachelorsStore.liked.contains(bachelor.id) ? 'Added to liked' : 'Removed from liked'),
                              backgroundColor: Theme.of(context).primaryColor
                          ),
                        );
                      },
                      icon: bachelorsStore.liked.contains(bachelor.id) ?
                      Icon(
                          Icons.thumb_up_alt,
                          color: Theme.of(context).primaryColor,
                          size: 24
                      ) :
                      const Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.grey,
                          size: 24
                      )
                  ),
                ],
              ),
              Text(
                '${bachelor.firstname} ${bachelor.lastname}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (bachelor.job != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Job: ', style: TextStyle(color: Colors.grey) ),
                        Text('${bachelor.job}', style: const TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  const SizedBox(width: 16),
                  if (bachelor.searchFor != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Looking for: ', style: TextStyle(color: Colors.grey) ),
                        Text(bachelor.searchFor!
                            .map((value) => value.name)
                            .join(', '),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  bachelor.description ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}