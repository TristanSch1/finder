import 'package:finder/widgets/avatar_widget.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BachelorPreview extends StatelessWidget {
  const BachelorPreview({Key? key, required this.bachelor}) : super(key: key);

  final Bachelor bachelor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/bachelor/${bachelor.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Avatar(imagePath: bachelor.avatar),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${bachelor.firstname} ${bachelor.lastname}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bachelor.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}