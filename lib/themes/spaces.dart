import 'package:flutter/material.dart';

class largeSpace extends StatelessWidget {
  const largeSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: maxHeight / 68,
    );
  }
}

class mediumSpace extends StatelessWidget {
  const mediumSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: maxHeight / 72,
    );
  }
}

class smallSpace extends StatelessWidget {
  const smallSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: maxHeight / 80,
    );
  }
}
