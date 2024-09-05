import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'alert_helper.dart';

class VAsyncValueWidget<T> extends StatelessWidget {
  const VAsyncValueWidget({required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: Text('error $e')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

extension AsyncValueUI on AsyncValue {
  Future<void> showAlertDialogOnError(
      BuildContext context, WidgetRef ref) async {
    if (!isLoading && hasError) {
      return AlertHelper().showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: error,
      );
    }
  }
}

extension StringHardcoded on String {
  String get hardcoded => this;
}
