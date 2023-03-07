import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/back_button.dart';

class PositionedIcon extends StatelessWidget {
  const PositionedIcon({
    super.key,
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
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 10),
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
