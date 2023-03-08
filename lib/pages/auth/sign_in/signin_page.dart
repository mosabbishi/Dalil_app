import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/auth/widgets/sigin_form.dart';
import 'package:dalil_app/pages/auth/sign_up/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.red,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              const SigninForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ليس لديك حساب؟ '),
                  TextButton(
                    onPressed: () {
                      Get.off(() => const SignupPage());
                    },
                    child: const Text('سجل من هنا'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
