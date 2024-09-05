// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_with_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoWithCategory {
  TodoCategoriesEnum get category => throw _privateConstructorUsedError;
  List<Todo> get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoWithCategoryCopyWith<TodoWithCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoWithCategoryCopyWith<$Res> {
  factory $TodoWithCategoryCopyWith(
          TodoWithCategory value, $Res Function(TodoWithCategory) then) =
      _$TodoWithCategoryCopyWithImpl<$Res, TodoWithCategory>;
  @useResult
  $Res call({TodoCategoriesEnum category, List<Todo> todo});
}

/// @nodoc
class _$TodoWithCategoryCopyWithImpl<$Res, $Val extends TodoWithCategory>
    implements $TodoWithCategoryCopyWith<$Res> {
  _$TodoWithCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? todo = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TodoCategoriesEnum,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoWithCategoryImplCopyWith<$Res>
    implements $TodoWithCategoryCopyWith<$Res> {
  factory _$$TodoWithCategoryImplCopyWith(_$TodoWithCategoryImpl value,
          $Res Function(_$TodoWithCategoryImpl) then) =
      __$$TodoWithCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodoCategoriesEnum category, List<Todo> todo});
}

/// @nodoc
class __$$TodoWithCategoryImplCopyWithImpl<$Res>
    extends _$TodoWithCategoryCopyWithImpl<$Res, _$TodoWithCategoryImpl>
    implements _$$TodoWithCategoryImplCopyWith<$Res> {
  __$$TodoWithCategoryImplCopyWithImpl(_$TodoWithCategoryImpl _value,
      $Res Function(_$TodoWithCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? todo = null,
  }) {
    return _then(_$TodoWithCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TodoCategoriesEnum,
      todo: null == todo
          ? _value._todo
          : todo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$TodoWithCategoryImpl implements _TodoWithCategory {
  _$TodoWithCategoryImpl(
      {required this.category, required final List<Todo> todo})
      : _todo = todo;

  @override
  final TodoCategoriesEnum category;
  final List<Todo> _todo;
  @override
  List<Todo> get todo {
    if (_todo is EqualUnmodifiableListView) return _todo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todo);
  }

  @override
  String toString() {
    return 'TodoWithCategory(category: $category, todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoWithCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._todo, _todo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_todo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoWithCategoryImplCopyWith<_$TodoWithCategoryImpl> get copyWith =>
      __$$TodoWithCategoryImplCopyWithImpl<_$TodoWithCategoryImpl>(
          this, _$identity);
}

abstract class _TodoWithCategory implements TodoWithCategory {
  factory _TodoWithCategory(
      {required final TodoCategoriesEnum category,
      required final List<Todo> todo}) = _$TodoWithCategoryImpl;

  @override
  TodoCategoriesEnum get category;
  @override
  List<Todo> get todo;
  @override
  @JsonKey(ignore: true)
  _$$TodoWithCategoryImplCopyWith<_$TodoWithCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
