import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iti/features/login/application/login_notifier.dart';
import 'package:iti/features/login/login_screen.dart';
import 'package:iti/features/todo/list/presentation/todo_screen.dart';
import 'package:iti/shared/widgets/v_async_value_widget.dart';

import 'themes/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(loginNotifierProvider);

    return MaterialApp(
      theme: appThemeData,
      home: VAsyncValueWidget(
          value: isLoggedIn,
          data: (isTrue) => isTrue ? TodoScreen() : LoginScreen()),
    );
  }
}
