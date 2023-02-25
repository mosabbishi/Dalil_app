import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/auth/widgets/signup_form.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          backgroundColor: Styles.black,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'تسجيل مستخدم جديد',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
                //
                const SignupForm(),
                //
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'أو سجل عن طريق:',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                      ),
                    )),
                    Expanded(
                        child: OutlinedButton(
                      onPressed: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
