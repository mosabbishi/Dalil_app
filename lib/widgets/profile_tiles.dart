import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData lead;
  final Color? color;
  final Widget trailing;
  final Function() onTap;
  const ProfileTile({
    super.key,
    required this.title,
    required this.lead,
    required this.onTap,
    this.trailing = const Icon(Icons.chevron_right),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        leading: Icon(
          lead,
          color: color,
        ),
        title: Text(title),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
