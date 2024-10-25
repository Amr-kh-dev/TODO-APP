import 'package:flutter/material.dart';
import 'package:flutter_application_1/App_theme.dart';
import 'package:flutter_application_1/models/task_model.dart';

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
                task.descrption ,
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
    );
  }
}
