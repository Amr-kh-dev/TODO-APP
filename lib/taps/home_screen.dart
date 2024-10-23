import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/taps/settings/setting_tap.dart';
import 'package:flutter_application_1/taps/tasks/add_task_button.dart';
import 'package:flutter_application_1/taps/tasks/task_tap.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [TaskTap(), SettingTap()];
  int curentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[curentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.zero,
        color: AppTheme.white,
        child: BottomNavigationBar(
            currentIndex: curentTabIndex,
            onTap: (index) => setState(() => curentTabIndex = index),
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => AddTaskButton(),
          
        ),
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
