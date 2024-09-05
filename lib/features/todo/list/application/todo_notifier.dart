import 'package:iti/features/todo/list/application/todo_categories_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/providers.dart';
import '../../../../shared/storage/todo_list_storage.dart';
import '../infrastructure/todo_repository.dart';
import 'todo.dart';

part 'todo_notifier.g.dart';

@Riverpod(keepAlive: true)
TodoListStorage todoListStorage(TodoListStorageRef ref) {
  return TodoListStorage(
    ref.watch(storageProvider),
  );
}

@Riverpod(keepAlive: true)
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository(
    ref.watch(todoListStorageProvider),
  );
}

List<Todo> dummy = [
  Todo(
    id: 1,
    isChecked: false,
    nama: 'nama',
    deskripsi: 'deskripsi',
    dateTime: DateTime.now().add(Duration(days: 8)),
    category: TodoCategoriesEnum.thisWeek,
  ),
  Todo(
      id: 2,
      isChecked: false,
      nama: 'nama 2',
      deskripsi: 'deskripsi 2',
      dateTime: DateTime.now().add(Duration(days: 1)),
      category: TodoCategoriesEnum.today),
  Todo(
      id: 3,
      isChecked: false,
      nama: 'nama 3',
      deskripsi: 'deskripsi 3',
      dateTime: DateTime.now().add(Duration(days: 3)),
      category: TodoCategoriesEnum.today),
  Todo(
      id: 4,
      isChecked: false,
      nama: 'nama 4',
      deskripsi: 'deskripsi 4',
      dateTime: DateTime.now().add(Duration(days: 1)),
      category: TodoCategoriesEnum.today),
  Todo(
      id: 5,
      isChecked: false,
      nama: 'nama 5',
      deskripsi: 'deskripsi 5',
      dateTime: DateTime.now().add(Duration(days: 1)),
      category: TodoCategoriesEnum.today),
];

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  FutureOr<List<List<Todo>>> build() async {
    final repo = ref.read(todoRepositoryProvider);

    final list = await repo.getAll();

    return categorize(list);
  }

  List<List<Todo>> categorize(List<Todo> list) {
    final transformAll = list
        .map((e) => e.copyWith(category: _getCategoryByDate(e.dateTime)))
        .toList();

    final today = transformAll
        .where((element) => element.category == TodoCategoriesEnum.today)
        .toList();
    final tomorrow = transformAll
        .where((element) => element.category == TodoCategoriesEnum.tomorrow)
        .toList();
    final thisWeek = transformAll
        .where((element) => element.category == TodoCategoriesEnum.thisWeek)
        .toList();
    final thisMonth = transformAll
        .where((element) => element.category == TodoCategoriesEnum.thisMonth)
        .toList();
    final thisYear = transformAll
        .where((element) => element.category == TodoCategoriesEnum.thisYear)
        .toList();
    final others = transformAll
        .where((element) => element.category == TodoCategoriesEnum.others)
        .toList();

    return [today, tomorrow, thisWeek, thisMonth, thisYear, others];
  }

  getAll() async {
    final repo = ref.read(todoRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final resp = await repo.getAll();

      if (resp == []) {
        return [];
      }

      return categorize(resp);
    });
  }

  check(int id, bool value) async {
    final repo = ref.read(todoRepositoryProvider);

    state = state.copyWithPrevious(state);

    state = await AsyncValue.guard(() async {
      final resp = await repo.getAll();

      if (resp == []) {
        return [];
      }

      final list = resp
          .map(
            (e) => e.id == id ? e.copyWith(isChecked: value) : e,
          )
          .toList();

      await repo.save(list);

      return categorize(list);
    });
  }

  TodoCategoriesEnum _getCategoryByDate(DateTime param) {
    final now = DateTime.now();

    final _diffInDays = param.difference(now).inDays;

    if (_diffInDays == 0) {
      return TodoCategoriesEnum.today;
    }

    if (_diffInDays == 1) {
      return TodoCategoriesEnum.tomorrow;
    }

    if (_diffInDays >= 0 && _diffInDays <= 7) {
      return TodoCategoriesEnum.thisWeek;
    }

    if (_diffInDays > 7 && _diffInDays <= 30) {
      return TodoCategoriesEnum.thisMonth;
    }

    if (_diffInDays > 30 && _diffInDays <= 365) {
      return TodoCategoriesEnum.thisYear;
    }

    return TodoCategoriesEnum.others;
  }

  // todo: calculate distance to sundays
}
