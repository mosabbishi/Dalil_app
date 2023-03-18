import 'package:flutter/material.dart';

class ContactRow extends StatelessWidget {
  final String contact;
  final IconData icon;
  final Color color;
  const ContactRow({
    super.key,
    required this.contact,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(width: 10.0),
            Text(contact),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
      ],
    );
  }
}
