import 'package:dalil_app/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/back_button.dart';

class PositionedIcon extends StatelessWidget {
  final Function() function;
  const PositionedIcon({
    super.key, required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const BackBtn(
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.bookmark,
                  color: Colors.white,
                ),
                onPressed: function,
              ),
            ),
            const SizedBox(width: 10),
            //
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.shareNodes,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
