import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode, color: Colors.white);
      }
      return const Icon(Icons.sunny, color: Colors.white);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(

      value: AdaptiveTheme.of(context).mode.isDark,
      onChanged: (value) {
        if (value) {
          AdaptiveTheme.of(context).setDark();
        } else {
          AdaptiveTheme.of(context).setLight();
        }
      },
      thumbIcon: thumbIcon,
      thumbColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Theme.of(context).primaryColor;
        },
      ),
    );
  }
}