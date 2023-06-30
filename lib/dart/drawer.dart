import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:finder/widgets/theme_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var drawer = (BuildContext context) {
  final currentRoute = ModalRoute.of(context)?.settings.name;

  return Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
       DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: const Text('Finder', style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      ListTile(
        title: const Text('Bachelors', style: TextStyle(fontSize: 18)),
        onTap: () {
          context.go('/');
        },
        tileColor: currentRoute == '/' ? Theme.of(context).primaryColorLight : null,
        textColor: currentRoute == '/' ? Theme.of(context).primaryColor : null,
        leading: const Icon(Icons.people),
        iconColor: currentRoute == '/' ? Theme.of(context).primaryColor : null,
      ),
      ListTile(
        title: const Text('Favorites', style: TextStyle(fontSize: 18)),
        onTap: () {
          context.go('/favorites');
        },
        tileColor: currentRoute == '/favorites' ? Theme.of(context).primaryColorLight : null,
        textColor: currentRoute == '/favorites' ? Theme.of(context).primaryColor : null,
        leading: const Icon(Icons.favorite),
        iconColor: currentRoute == '/favorites' ? Theme.of(context).primaryColor : null,
      ),
      const Divider(),
      const ThemeSwitch(),
    ],
  ),
  );
};