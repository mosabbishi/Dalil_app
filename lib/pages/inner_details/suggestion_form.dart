import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/nav_pages/main_page.dart';
import 'package:dalil_app/services/suggestion_services.dart';
import 'package:dalil_app/widgets/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionForm extends StatelessWidget {
  SuggestionForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  SuggestionServices suggestionServices = SuggestionServices();

  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('الإسم:*'),
          FormFields(
            controller: suggestionServices.nameController,
            validator: (value) {
              return value!.isEmpty ? 'ff' : null;
            },
          ),
          const Text('التصنيف:*'),
          FormFields(
            controller: suggestionServices.typeController,
            validator: (value) {
              return value!.isEmpty ? 'ff' : null;
            },
          ),
          const Text('العنوان:'),
          FormFields(
            controller: suggestionServices.addressController,
            validator: (value) {
              return value!.isEmpty ? 'ff' : null;
            },
            hint: 'المنطقة - المدينة - الحي',
          ),
          const Text('الموقع على الخريطة:'),
          FormFields(
            controller: suggestionServices.locationController,
            validator: (value) {
              return value!.isEmpty ? 'ff' : null;
            },
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Styles.black,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SuggestionServices.makeSuggestion(
                      id: 'dd',
                      name: suggestionServices.nameController.text,
                      type: suggestionServices.typeController.text,
                      address: suggestionServices.addressController.text,
                    );
                    Get.snackbar('title',
                        'thank you for your suggestion, we will look into it');
                    Get.off(() => const MainPage());
                  }
                },
                child: const Text('إرسال')),
          ),
        ],
      ),
    );
  }
}
