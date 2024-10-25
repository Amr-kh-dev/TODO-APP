import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/widgets/defeult_elevten_button.dart';
import 'package:flutter_application_1/widgets/defeult_text_form_filed.dart';
import 'package:intl/intl.dart';

class AddTaskButton extends StatefulWidget {
  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();
  DateFormat dateFormat = DateFormat('yy/MM/dd');
  DateTime dateTime = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      padding: EdgeInsets.all(20),
      height: height,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text('Add new task', style: textStyle),
            SizedBox(height: 20),
            DefecultTextFormFiled(
              controller: titleController,
              hintText: 'Enter task title',
              validate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter task title';
                }
                ;
                return null;
              },
            ),
            SizedBox(height: 20),
            DefecultTextFormFiled(
              controller: descrptionController,
              hintText: 'Enter task descrption',
              validate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter task descrption';
                }
                ;
                return null;
              },
            ),
            SizedBox(height: 20),
            Text('Select date',
                style: textStyle?.copyWith(fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            InkWell(
                onTap: () async {
                  DateTime? selectDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                      initialDate: dateTime,
                      initialEntryMode: DatePickerEntryMode.calendarOnly);
                  if (selectDate != null && selectDate != dateTime) {
                    dateTime = selectDate;
                    setState(() {});
                  }
                },
                child: Text(dateFormat.format(dateTime))),
            SizedBox(
              height: 32,
            ),
            DefeultElevtenButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addTask();
                }
              },
              label: 'Add',
            )
          ],
        ),
      ),
    );
  }

  void addTask() {
    TaskModel tasks= TaskModel(
        title: titleController.text,
        dateTime: dateTime,
        descrption: descrptionController.text,
      );
  }
}
