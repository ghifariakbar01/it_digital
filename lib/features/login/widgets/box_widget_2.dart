import 'package:flutter/material.dart';

import '../../../themes/colors.dart';

class BoxWidget3 extends StatelessWidget {
  const BoxWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50,
      child: Container(
        color: Palette.backgroundItemsColor3,
        height: MediaQuery.of(context).size.height / 2,
        width: 300,
      ),
    );
  }
}
