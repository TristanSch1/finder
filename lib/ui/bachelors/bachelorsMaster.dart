import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:finder/dart/drawer.dart';
import 'package:finder/widgets/bachelor_reset_filter_widget.dart';
import 'package:finder/widgets/bachelor_search_widget.dart';
import 'package:finder/widgets/bachelors_list_widget.dart';
import 'package:finder/widgets/gender_filters_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BachelorsMaster extends StatelessWidget {
  const BachelorsMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: const Text('Bachelors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => context.go('/favorites'),
          ),
          const ResetFilter(),
        ],
      ),
      body: const Column(
        children: [
          BachelorSearch(),
          GenderFilters(),
          BachelorsList(),
        ],
      ),
    );
  }
}