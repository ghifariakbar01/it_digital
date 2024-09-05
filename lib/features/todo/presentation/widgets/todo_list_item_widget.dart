import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../themes/theme.dart';
import '../../list/application/todo.dart';
import '../../list/application/todo_notifier.dart';

class TodoListItemWidget extends HookConsumerWidget {
  const TodoListItemWidget({super.key, required this.item});

  final Todo item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowDetail = useState(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: item.isChecked,
          onChanged: (value) {
            if (value == null) {
              return;
            }

            ref.read(todoNotifierProvider.notifier).check(item.id, value);
          },
        ),
        InkWell(
          onTap: () => isShowDetail.value == true
              ? isShowDetail.value = false
              : isShowDetail.value = true,
          child: Ink(
            child: Text(
              item.nama,
              style: appThemeData.textTheme.bodyMedium!.copyWith(
                color: item.isChecked ? null : Colors.black,
                decoration: item.isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isShowDetail.value) ...[
              SizedBox(
                width: 8,
              ),
              Text(
                item.deskripsi,
                style: appThemeData.textTheme.bodySmall!.copyWith(
                  decoration: item.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                DateFormat('dd-MM-yyyy').format(item.dateTime),
                style: appThemeData.textTheme.bodySmall!.copyWith(
                  decoration: item.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ]
          ],
        )
      ],
    );
  }
}
