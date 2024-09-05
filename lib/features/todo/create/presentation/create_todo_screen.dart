import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:iti/features/todo/create/application/create_todo_notifier.dart';
import 'package:iti/features/todo/list/application/todo.dart';
import 'package:iti/features/todo/list/application/todo_categories_enum.dart';
import 'package:iti/features/todo/list/application/todo_notifier.dart';
import 'package:iti/shared/widgets/v_async_value_widget.dart';

import '../../../../shared/widgets/alert_helper.dart';
import '../../../../themes/colors.dart';
import '../../../../themes/spaces.dart';
import '../../../../themes/theme.dart';

class CreateTodoScreen extends HookConsumerWidget {
  const CreateTodoScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(createTodoNotifierProvider, (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != false &&
          state.hasError == false) {
        return AlertHelper.showSnackBar(
          context,
          color: Palette.successDialogColor,
          message: 'Sukses Input',
          onDone: () {
            ref.read(todoNotifierProvider.notifier).getAll();
            Navigator.pop(context);
            return Future.value(true);
          },
        );
      }

      return state.showAlertDialogOnError(context, ref);
    });

    final dueDate = useState(DateTime.now());
    final dueDateTextController = useTextEditingController();

    final namaTextController = useTextEditingController();
    final deskripsiTextController = useTextEditingController();

    final createTodoNotifier = ref.watch(createTodoNotifierProvider);

    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final isShowError = useState(false);

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create New To-Do',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            autovalidateMode: isShowError.value
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama',
                  style: appThemeData.textTheme.bodyMedium,
                ),
                smallSpace(),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: namaTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (item) {
                      if (item == null) {
                        return 'Nama tidak boleh kosong';
                      } else if (item.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                ),
                mediumSpace(),
                Text(
                  'Deskripsi',
                  style: appThemeData.textTheme.bodyMedium,
                ),
                smallSpace(),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: deskripsiTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (item) {
                      if (item == null) {
                        return 'Deskripsi tidak boleh kosong';
                      } else if (item.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                ),
                mediumSpace(),
                Text(
                  'Due Date',
                  style: appThemeData.textTheme.bodyMedium,
                ),
                smallSpace(),
                SizedBox(
                  height: 40,
                  child: InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)));

                      if (date == null) {
                        return;
                      }

                      dueDate.value = date;
                      dueDateTextController.text =
                          DateFormat('E, dd-MM-yyyy').format(date);
                    },
                    child: IgnorePointer(
                      ignoring: true,
                      child: TextFormField(
                        controller: dueDateTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (item) {
                          if (item == null) {
                            return 'Due Date tidak boleh kosong';
                          } else if (item.isEmpty) {
                            return 'Due Date tidak boleh kosong';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                mediumSpace(),
                Center(
                  child: VAsyncValueWidget(
                    value: createTodoNotifier,
                    data: (_) => TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          isShowError.value = false;

                          final todo = Todo(
                            id: 0,
                            isChecked: false,
                            dateTime: dueDate.value,
                            nama: namaTextController.text,
                            deskripsi: deskripsiTextController.text,
                            category: TodoCategoriesEnum.today,
                          );

                          return ref
                              .read(createTodoNotifierProvider.notifier)
                              .add(todo);
                        }

                        isShowError.value = true;
                      },
                      child: Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
