import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/back_button.dart';
import '../../widgets/filter_chips.dart';

class Apliences extends StatelessWidget {
  final String subTitle;
  const Apliences({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(subTitle),
          leading: const BackBtn(),
        ),
        body: Column(
          children: [
            // search bar
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(placeholder: 'بحث'),
            ),
            // filter chips
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 35,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FilterChipsList(),
                  ],
                ),
              ),
            ),
            // contant
            ListTile(
              tileColor: Colors.grey[200],
              onTap: () {},
              leading: const Icon(
                Icons.account_box,
                size: 45,
              ),
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
