import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/home_page.dart';
import 'package:dalil_app/models/user_model.dart';
import 'package:dalil_app/pages/auth/widgets/sign_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  AuthService _authServices = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              controller: _username,
              validator: (value) {
                return value!.isEmpty ? 'please enter a name' : null;
              },
              decoration:
                  Styles.buildInputDecoration('اسم المستخدم', Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              controller: _email,
              validator: (value) {
                return value!.isEmpty ? 'please enter an email' : null;
              },
              decoration: Styles.buildInputDecoration(
                  'البريد الإلكتروني', Icons.email_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              controller: _phone,
              validator: (value) {
                return value!.isEmpty ? 'please enter a phone number' : null;
              },
              decoration: Styles.buildInputDecoration(
                  'رقم الجوال', Icons.phone_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              controller: _password,
              validator: (value) {
                return (value!.isEmpty || value.length < 7)
                    ? 'please enter a password'
                    : null;
              },
              decoration:
                  Styles.buildInputDecoration('كلمة المرور', Icons.fingerprint),
            ),
          ),
          SignButton(
            title: 'تسجيل',
            function: () {
              if (_formKey.currentState!.validate()) {
                _authServices
                    .registerNewUser(
                  _email.text.trim(),
                  _password.text.trim(),
                )
                    .whenComplete(() {
                  Get.snackbar(
                    '',
                    'تم التسجيل بنجاح',
                    snackStyle: SnackStyle.FLOATING,
                    colorText: Colors.green,
                  );
                  _authServices.createUser(
                    UserModel(
                      username: _username.text.trim(),
                      email: _email.text.trim(),
                      phone: _phone.text.trim(),
                      password: _password.text.trim(),
                    ),
                  );
                  Get.offAll(() => const HomePage());
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
