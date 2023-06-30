import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:finder/routes/router.dart';
import 'package:flutter/material.dart';

class Finder extends StatelessWidget {
  const Finder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColorLight: Colors.teal[100],
        primaryColor: Colors.teal,
        primaryColorDark: Colors.teal[600],
        primarySwatch: Colors.teal,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          displaySmall: const TextStyle(fontSize: 14.0, color: Colors.grey),
          displayMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.7)),
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.7)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white.withOpacity(0.8),
          titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColorLight: Colors.teal[50],
        primaryColor: Colors.teal[400],
        primaryColorDark: Colors.teal[500],
        primarySwatch: Colors.teal,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          displaySmall: TextStyle(fontSize: 14.0, color: Colors.white.withOpacity(0.5)),
          displayMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[400],
          foregroundColor: Colors.white.withOpacity(0.7),
          titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Finder',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        routerConfig: router,
      ),
  );
}