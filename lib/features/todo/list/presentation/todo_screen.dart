import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iti/features/todo/create/presentation/create_todo_screen.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/spaces.dart';
import '../../../../themes/theme.dart';
import "package:iti/features/todo/list/presentation/widgets/todo_categories_widget.dart";
import "package:iti/features/todo/presentation/widgets/todo_list_widget.dart";

class TodoScreen extends HookConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currIndex = useState(0);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              largeSpace(),
              Center(
                child: Text(
                  'Try one of these to start',
                  style: appThemeData.textTheme.titleLarge,
                ),
              ),
              mediumSpace(),
              TodoCategoriesWidget(_currIndex),
              largeSpace(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Palette.containerColor,
                  ),
                  child: _currIndex.value == 0
                      ? TodoListWidget()
                      : Text(
                          'Tidak ada nilai',
                          style: appThemeData.textTheme.bodyMedium,
                        ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => CreateTodoScreen(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
