import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/firebase_function.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/taps/tasks/task_itame.dart';
import 'package:flutter_application_1/taps/tasks_provider.dart';
import 'package:provider/provider.dart';

class TaskTap extends StatefulWidget {
  @override
  State<TaskTap> createState() => _TaskTapState();
}

class _TaskTapState extends State<TaskTap> {
  bool flags = true;
  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider = Provider.of<TasksProvider>(context);
    if (flags) {
      tasksProvider.getAllTasksFormFireBase();
      flags = false;
    }
    double higth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: higth * 0.2,
              width: double.infinity,
              color: AppTheme.primaryLight,
            ),
            Padding(
                padding: EdgeInsetsDirectional.only(
                  start: width * 0.05,
                ),
                child: SafeArea(
                    child: Text(
                  'ToDo List',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ))),
            Padding(
              padding: EdgeInsetsDirectional.only(top: higth * 0.15),
              child: EasyInfiniteDateTimeLine(
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                focusDate: tasksProvider.selectedDate,
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateChange: (selectedDate) {
                  tasksProvider.changeDate(selectedDate);
                 
                },
                showTimelineHeader: false,
                dayProps: EasyDayProps(
                  height: 79,
                  width: 58,
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    dayNumStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryLight),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryLight),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    dayNumStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black),
                  ),
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    dayNumStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (_, index) => TaskItame(
            task: tasksProvider.tasks[index],
          ),
          itemCount: tasksProvider.tasks.length,
        ))
      ],
    );
  }
}
