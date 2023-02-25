import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  Future pickImage() async {
    var imagePicked =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('المعلومات الشخصية'),
        ),
        body: Column(
          children: [
            ProfileTile(
              title: 'صورة الحساب',
              lead: Icons.ac_unit,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'تغيير الصورة',
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Container(
                                height: 120,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent[100],
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                                child: const Icon(Icons.add_a_photo_outlined),
                              )),
                              // Image.file(pi)
                        ],
                      ),
                    );
                  },
                );
                // method to pick an image,
              },
            ),
            ProfileTile(
              title: 'اسم المستخدم',
              lead: Icons.ac_unit,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: Colors.amber,
                      height: 200,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
