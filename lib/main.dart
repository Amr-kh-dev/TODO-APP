import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/FCM/fcm.dart';
import 'package:flutter_application_1/auth/log_in.dart';
import 'package:flutter_application_1/auth/registretion.dart';
import 'package:flutter_application_1/taps/home_screen.dart';
import 'package:flutter_application_1/taps/tasks_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 await Fcm.fcmInti();


  runApp(
      ChangeNotifierProvider(create: (_) => TasksProvider(), child: todoApp()));
}

class todoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route: (_) => HomeScreen(),
        LogIn.route: (_) => LogIn(),
        Registretion.route: (_) => Registretion(),
      },
      initialRoute: HomeScreen.route,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
