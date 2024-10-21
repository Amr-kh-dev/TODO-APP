import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/taps/home_screen.dart';

void main() {
  runApp(todoApp());
}

class todoApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.route:(_) => HomeScreen()},
      initialRoute: HomeScreen.route,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
