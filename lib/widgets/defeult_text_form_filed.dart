import 'package:flutter/material.dart';

class DefecultTextFormFiled extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validate;

  DefecultTextFormFiled({Key? key, required this.controller, required this.hintText, this.validate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validate,
        decoration: InputDecoration(hintText: hintText));
  }
}
