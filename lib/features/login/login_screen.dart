import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iti/themes/colors.dart';
import "package:iti/features/login/widgets/login_background_widget.dart";
import "package:iti/features/login/widgets/box_widget_3.dart";

import 'widgets/box_widget_1.dart';
import "package:iti/features/login/widgets/login_widget.dart";

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          final maxHeight = constraint.maxHeight;
          final maxWidth = constraint.maxWidth;

          return Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: LoginBackgroundWidget(),
              ),
              Positioned(
                right: -(maxWidth / 2),
                bottom: maxHeight / 4,
                child: BoxWidget3(),
              ),
              Positioned(
                left: (maxWidth / 5),
                bottom: -(maxHeight / 2.25),
                child: Transform.rotate(
                  angle: 50,
                  child: Container(
                    color: Palette.backgroundItemsColor2,
                    height: MediaQuery.of(context).size.height / 2,
                    width: 300,
                  ),
                ),
              ),
              Positioned(
                left: -(maxWidth / 2),
                top: 0,
                child: BoxWidget1(),
              ),
              Align(
                alignment: Alignment.center,
                child: LoginWidget(
                  maxHeight: maxHeight,
                  maxWidth: maxWidth,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
