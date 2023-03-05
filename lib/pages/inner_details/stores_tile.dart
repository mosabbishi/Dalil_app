import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String headerImage;
  final String address;
  final Function() onTap;
  const StoreTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.headerImage,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          onTap: onTap,
          leading: FancyShimmerImage(
            imageUrl: headerImage,
            boxFit: BoxFit.cover,
            width: 100,
          ),
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle),
              Text(address),
            ],
          ),
          isThreeLine: true,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
