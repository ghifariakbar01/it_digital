import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iti/features/todo/list/application/todo_categories_enum.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required int id,
    required bool isChecked,
    required String nama,
    required String deskripsi,
    required DateTime dateTime,
    required TodoCategoriesEnum category,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  factory Todo.initial() => Todo(
        id: 0,
        isChecked: false,
        nama: '',
        deskripsi: '',
        dateTime: DateTime.now(),
        category: TodoCategoriesEnum.others,
      );
}
