import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/home_page.dart';
import 'package:dalil_app/pages/auth/widgets/sign_btn.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/widgets/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  @override
  Widget build(BuildContext context) {
    AuthService _authServices = AuthService();
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

    @override
    void dispose() {
      _email.dispose();
      _password.dispose();
      super.dispose();
    }

    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormField(
          controller: _email,
          validator: (value) {
            return value!.isEmpty ? 'wrong' : null;
          },
          decoration:
              Styles.buildInputDecoration('البريد الإلكتروني', Icons.email),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _password,
          validator: (value) {
            return value!.isEmpty ? 'wrong' : null;
          },
          decoration:
              Styles.buildInputDecoration('كلمة المرور', Icons.fingerprint),
        ),
        const ForgetPassword(),
        SignButton(
          title: 'تسجيل',
          function: () {
            if (_formKey.currentState!.validate()) {
              _authServices
                  .signinUser(
                    _email.text.trim(),
                    _password.text.trim(),
                  )
                  .whenComplete(
                    () => Get.to(
                      () => const HomePage(),
                    ),
                  );
            }
          },
        ),
      ]),
    );
  }
}
