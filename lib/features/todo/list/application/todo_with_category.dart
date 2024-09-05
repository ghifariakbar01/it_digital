import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo.dart';
import 'todo_categories_enum.dart';

part 'todo_with_category.freezed.dart';

@freezed
class TodoWithCategory with _$TodoWithCategory {
  factory TodoWithCategory({
    required TodoCategoriesEnum category,
    required List<Todo> todo,
  }) = _TodoWithCategory;
}
