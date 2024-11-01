import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/defeult_elevten_button.dart';
import 'package:flutter_application_1/widgets/defeult_text_form_filed.dart';

class Registretion extends StatefulWidget {
  static const route = '/registretion';
  const Registretion({super.key});

  @override
  State<Registretion> createState() => _RegistretionState();
}

class _RegistretionState extends State<Registretion> {
  TextEditingController email = TextEditingController();

  TextEditingController pasword = TextEditingController();
  TextEditingController name = TextEditingController();


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registretion'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefecultTextFormFiled(
                controller: name,
                hintText: 'Name',
                validate: (value) {
                  if (value == null || value.trim().length < 5) {
                    return 'E-mail can`t be less than 5 ';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              DefecultTextFormFiled(
                controller: email,
                hintText: 'E-mail',
                validate: (value) {
                  if (value == null || value.trim().length < 5) {
                    return 'E-mail can`t be less than 5 ';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              DefecultTextFormFiled(
                controller: pasword,
                hintText: 'pasword',
                validate: (value) {
                  if (value == null || value.trim().length < 8) {
                    return 'Pasword can`t be less than 8 ';
                  } else {
                    return null;
                  }
                },
                isPasword: true,
              ),
              SizedBox(
                height: 23,
              ),
              DefeultElevtenButton(onPressed: () {}, label: 'Registretion'),
              SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(Registretion.route),
                  child: Text('have an account'))
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {}
  }
}
