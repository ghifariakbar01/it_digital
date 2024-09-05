// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListStorageHash() => r'4fea562a9a46d941e8534dc4e7e7490cd28d1391';

/// See also [todoListStorage].
@ProviderFor(todoListStorage)
final todoListStorageProvider = Provider<TodoListStorage>.internal(
  todoListStorage,
  name: r'todoListStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoListStorageRef = ProviderRef<TodoListStorage>;
String _$todoRepositoryHash() => r'ee6a028a8b41bc4c93b1bbb610089d13351477b4';

/// See also [todoRepository].
@ProviderFor(todoRepository)
final todoRepositoryProvider = Provider<TodoRepository>.internal(
  todoRepository,
  name: r'todoRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoRepositoryRef = ProviderRef<TodoRepository>;
String _$todoNotifierHash() => r'30a436189eb52a66417821f7778c967c440ad226';

/// See also [TodoNotifier].
@ProviderFor(TodoNotifier)
final todoNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TodoNotifier, List<List<Todo>>>.internal(
  TodoNotifier.new,
  name: r'todoNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoNotifier = AutoDisposeAsyncNotifier<List<List<Todo>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
