import 'package:flutter/material.dart';

class FilterChipsList extends StatelessWidget {
  const FilterChipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: const Text('sub'),
      onSelected: (value) {},
    );
  }
}
