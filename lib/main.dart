import 'package:finder/stores/bachelorsStore.dart';
import 'package:flutter/material.dart';
import 'package:finder/ui/finder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<BachelorsStore>(
          create: (_) => BachelorsStore(),
        ),
      ],
      child: const Finder(),
    ),
  );
}
