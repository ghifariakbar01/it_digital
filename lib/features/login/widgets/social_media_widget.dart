import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 25, height: 25, child: Image.asset('images/google.png')),
        SizedBox(
          width: 8,
        ),
        SizedBox(
            width: 25, height: 25, child: Image.asset('images/facebook.png')),
        SizedBox(
          width: 8,
        ),
        SizedBox(
            width: 25, height: 25, child: Image.asset('images/linkedin.png')),
      ],
    );
  }
}
