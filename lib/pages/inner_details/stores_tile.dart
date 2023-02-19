import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onTap;
  const StoreTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration:
            BoxDecoration(boxShadow: Styles().boxShadows, color: Colors.white),
        child: ListTile(
          onTap: onTap,
          leading: const Icon(Icons.account_box),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
