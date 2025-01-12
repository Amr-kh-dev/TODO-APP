import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_function.dart';
import 'package:flutter_application_1/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();


    Future<void> getAllTasksFormFireBase() async {
    List<TaskModel> allTasks = await FirebaseFunction.getAllTaskCollection();
    tasks = allTasks
        .where((element) =>
            element.dateTime.year == selectedDate.year &&
            element.dateTime.month == selectedDate.month &&
            element.dateTime.day == selectedDate.day)
        .toList();
    notifyListeners();
  }

  void changeDate(DateTime date) {
    selectedDate = date;
    getAllTasksFormFireBase();
  }
}
