import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:iti/themes/theme.dart';

class AlertHelper {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? color,
    Future<void> Function()? onDone,
  }) {
    showFlash(
      context: context,
      persistent: true,
      barrierDismissible: false,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: color ?? Colors.red,
          behavior: FlashBehavior.floating,
          content: Text(
            message,
            style: appThemeData.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        );
      },
    ).then((_) => onDone != null ? onDone() : () {});
  }

  void showExceptionAlertDialog({
    required String title,
    required dynamic exception,
    required BuildContext context,
  }) {
    return showSnackBar(
      context,
      message: '$title\n${_message(exception)}',
    );
  }

  String _message(dynamic exception) {
    return exception.toString();
  }
}
