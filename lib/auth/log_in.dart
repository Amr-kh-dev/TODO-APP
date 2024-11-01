import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/registretion.dart';
import 'package:flutter_application_1/widgets/defeult_elevten_button.dart';
import 'package:flutter_application_1/widgets/defeult_text_form_filed.dart';

class LogIn extends StatefulWidget {
  static const String route = '/login';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();

  TextEditingController pasword = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              DefeultElevtenButton(onPressed: () {}, label: 'log in'),
              SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(Registretion.route),
                  child: Text('don`t have an account'))
            ],
          ),
        ),
      ),
    );
}

    void login() {
      if (formKey.currentState!.validate()) {
        
      }
    }
  }