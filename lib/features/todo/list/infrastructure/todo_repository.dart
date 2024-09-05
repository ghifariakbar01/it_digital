import 'dart:convert';

import '../../../../shared/storage/item_storage.dart';
import '../application/todo.dart';

class TodoRepository {
  final ItemStorage storage;

  TodoRepository(this.storage);

  Future<void> save(List<Todo> list) async {
    final json = jsonEncode(list);
    return storage.save(json);
  }

  Future<List<Todo>> getAll() async {
    final resp = await storage.read();

    if (resp == null) {
      return [];
    }

    if (resp.isEmpty || resp == '[]') {
      return [];
    }

    final json = jsonDecode(resp);

    return (json as List).map((e) => Todo.fromJson(e)).toList();
  }

  clear() async {
    return storage.clear();
  }
}
