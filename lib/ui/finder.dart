import 'package:finder/routes/router.dart';
import 'package:flutter/material.dart';

class Finder extends StatelessWidget {
  const Finder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routerConfig: router,
  );
}