import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class SuggestionForm extends StatelessWidget {
  SuggestionForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

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
            controller: controller,
            validator: (p0) {},
          ),
          const Text('التصنيف:*'),
          FormFields(
            controller: controller,
            validator: (p0) {},
          ),
          const Text('العنوان:'),
          FormFields(
            controller: controller,
            validator: (p0) {},
            hint: 'المنطقة - المدينة - الحي',
          ),
          const Text('الموقع على الخريطة:'),
          FormFields(
            controller: controller,
            validator: (p0) {},
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Styles.black,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
              onPressed: () {},
              child: const Text('إرسال'),
            ),
          ),
        ],
      ),
    );
  }
}
