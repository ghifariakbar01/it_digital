import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iti/features/todo/list/application/todo_categories_enum.dart';

import '../../../../shared/widgets/v_async_value_widget.dart';
import '../../../../themes/spaces.dart';
import '../../../../themes/theme.dart';
import '../../list/application/todo_notifier.dart';
import "package:iti/features/todo/presentation/widgets/todo_list_item_widget.dart";

class TodoListWidget extends HookConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);

    return VAsyncValueWidget(
      value: todos,
      data: (allList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'To - Do',
              style: appThemeData.textTheme.titleLarge,
            ),
            mediumSpace(),
            for (int i = 0; i < allList.length; i++) ...[
              if (allList[i].isEmpty) ...[
                Container()
              ] else ...[
                Builder(builder: (context) {
                  final category = allList[i].first.category;
                  String msg = '';

                  switch (category) {
                    case TodoCategoriesEnum.today:
                      msg = 'In 24 hours';
                      break;
                    case TodoCategoriesEnum.tomorrow:
                      msg = 'In 24 hours';
                      break;
                    case TodoCategoriesEnum.thisWeek:
                      msg = 'In 7 Days';
                      break;
                    case TodoCategoriesEnum.thisMonth:
                      msg = 'In 30 Days';
                      break;
                    case TodoCategoriesEnum.thisYear:
                      msg = 'This Year';
                      break;
                    default:
                      msg = 'Others';
                      break;
                  }

                  return Text(
                    msg,
                    style: appThemeData.textTheme.bodyLarge,
                  );
                }),
                smallSpace(),
                Column(
                  children: [
                    for (final item in allList[i]) ...[
                      TodoListItemWidget(
                        item: item,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                    mediumSpace(),
                  ],
                )
              ]
            ]
          ],
        );
      },
    );
  }
}
