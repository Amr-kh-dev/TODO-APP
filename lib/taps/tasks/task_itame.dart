import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/firebase_function.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/taps/tasks_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TaskItame extends StatelessWidget {
  TaskModel task;
  TaskItame({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                FirebaseFunction.deleteTaskForomFireStore(task.id).timeout(
                  Duration(milliseconds: 1000),
                  onTimeout: () {
                    Provider.of<TasksProvider>(context,listen: false)
                        .getAllTasksFormFireBase();
                  },
                ).catchError((_)=>Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    ));
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                width: 4,
                height: 32,
                color: AppTheme.primaryLight,
              ),
              Column(
                children: [
                  Text(
                    task.title,
                    style: textTheme.titleMedium
                        ?.copyWith(color: AppTheme.primaryLight),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    task.descrption,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 34,
                width: 69,
                decoration: BoxDecoration(
                    color: AppTheme.primaryLight,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.check,
                  color: AppTheme.white,
                  size: 32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
