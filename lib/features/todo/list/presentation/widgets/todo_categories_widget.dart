import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'todo_item_widget.dart';

class TodoCategoriesWidget extends HookWidget {
  const TodoCategoriesWidget(this.currIndex, {super.key});

  final ValueNotifier<int> currIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TodoItemWidget(
          icon: Icons.list_alt_rounded,
          index: 0,
          currIndex: currIndex,
          title: 'To - Do',
        ),
        TodoItemWidget(
          icon: Icons.people,
          index: 1,
          currIndex: currIndex,
          title: 'Meeting',
        ),
        TodoItemWidget(
          icon: Icons.lightbulb,
          index: 2,
          currIndex: currIndex,
          title: 'Idea',
        ),
        TodoItemWidget(
          index: 3,
          currIndex: currIndex,
          title: 'Blank',
        ),
      ],
    );
  }
}
