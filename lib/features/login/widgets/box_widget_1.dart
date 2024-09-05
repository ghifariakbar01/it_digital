import 'package:flutter/material.dart';

import '../../../themes/colors.dart';

class BoxWidget1 extends StatelessWidget {
  const BoxWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50,
      child: Container(
        color: Palette.backgroundItemsColor1,
        height: MediaQuery.of(context).size.height / 2,
        width: 300,
      ),
    );
  }
}
