import 'package:flutter/material.dart';

class DefecultTextFormFiled extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  String? Function(String?)? validate;
  bool isPasword;

  DefecultTextFormFiled({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.isPasword = false,
  }) : super(key: key);

  @override
  State<DefecultTextFormFiled> createState() => _DefecultTextFormFiledState();
}

class _DefecultTextFormFiledState extends State<DefecultTextFormFiled> {
  late bool isObscu = widget.isPasword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      decoration: InputDecoration(
          suffixIcon: widget.isPasword
              ? IconButton(
                  onPressed: () {
                    isObscu = !isObscu;
                    setState(() {});
                  },
                  icon: isObscu
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off))
              : null,
          hintText: widget.hintText),
      obscureText: isObscu,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
