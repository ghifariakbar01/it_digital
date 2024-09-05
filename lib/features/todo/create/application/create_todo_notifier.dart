import 'dart:developer';

import 'package:iti/features/todo/list/application/todo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../list/application/todo.dart';

part 'create_todo_notifier.g.dart';

@riverpod
class CreateTodoNotifier extends _$CreateTodoNotifier {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  add(Todo todo) async {
    final repo = ref.read(todoRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final list = await repo.getAll();

      if (list.isEmpty) {
        await repo.save([todo]);
        return true;
      } else {
        final _list = [
          ...list,
          todo.copyWith(id: list.last.id + 1),
        ].toSet().toList();

        await repo.save(_list);

        log('todo ${todo.copyWith(id: list.last.id + 1)}');

        return true;
      }
    });
  }
}
