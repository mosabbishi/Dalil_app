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
  final _formKey = GlobalKey<FormState>();
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
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('اسم المستخدم'),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: docs['username'],
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                )),
                            controller: _username,
                          ),
                          const Text('البريد الإلكتروني'),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: docs['email'],
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                )),
                            controller: _email,
                          ),
                          const Text('رقم الجوال'),
                          TextFormField(
                            controller: _phone,
                            decoration: InputDecoration(
                                hintText: docs['phone'],
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                )),
                          ),
                          const Text('كلمة المرور'),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: docs['password'],
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                )),
                            controller: _password,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                await FireStoreServices.updateDocument(
                                  id: docs.id,
                                  username: _username.text,
                                  email: _email.text,
                                  phone: _phone.text,
                                  password: _password.text,
                                );
                              },
                              child: const Text('تعديل'),
                            ),
                          ),
                        ],
                      ),
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

  Future updateScreen() async {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                FireStoreServices.updateDocument(
                  username: _username.text,
                  email: _email.text,
                  phone: _phone.text,
                  password: _password.text,
                );
              },
              child: const Text('تعديل'),
            ),
          ),
        ],
      ),
    );
  }
}
