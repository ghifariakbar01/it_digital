import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';
import '../../../../../themes/spaces.dart';
import '../../../../../themes/theme.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget(
      {super.key,
      this.icon,
      required this.title,
      required this.index,
      required this.currIndex});

  final IconData? icon;
  final String title;

  final int index;
  final ValueNotifier<int> currIndex;

  @override
  Widget build(BuildContext context) {
    final isCurrent = currIndex.value == index;

    return Container(
      height: 135,
      width: 75,
      child: Column(
        children: [
          InkWell(
            onTap: () => currIndex.value = index,
            child: Ink(
                height: 85,
                width: 75,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isCurrent
                      ? Palette.tertiaryColor
                      : Palette.containerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: icon == null
                    ? Container()
                    : Icon(
                        icon,
                        size: 40,
                        color: isCurrent
                            ? Palette.primaryColor
                            : Palette.tertiaryColor,
                      )),
          ),
          mediumSpace(),
          Text(
            title,
            style: appThemeData.textTheme.titleMedium!.copyWith(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
