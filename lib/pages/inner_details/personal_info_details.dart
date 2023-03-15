import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../../services/firestore_services.dart';
import '../../utilities/back_button.dart';

class PersonalInfoDetails extends StatefulWidget {
  const PersonalInfoDetails({super.key});

  @override
  State<PersonalInfoDetails> createState() => _PersonalInfoDetailsState();
}

class _PersonalInfoDetailsState extends State<PersonalInfoDetails> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isObsecure = false;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
        ),
        body: StreamBuilder(
          stream: FireStoreServices.userCollection
              .where('email', isEqualTo: AuthService.firebaseUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot docs = snapshot.data!.docs[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('اسم المستخدم'),
                        TextFormField(
                          initialValue: docs['username'],
                          // controller: _username,
                        ),
                        const Text('البريد الإلكتروني'),
                        TextFormField(
                          initialValue: docs['email'],
                          // controller: _email,
                        ),
                        const Text('رقم الجوال'),
                        TextFormField(
                          initialValue: docs['phone'],
                          // controller: _phone,
                        ),
                        const Text('كلمة المرور'),
                        TextFormField(
                          initialValue: docs['password'],
                          // controller: _password,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('تعديل'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
