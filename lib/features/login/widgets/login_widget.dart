import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iti/features/login/widgets/social_media_widget.dart';
import 'package:iti/shared/widgets/alert_helper.dart';

import '../../../themes/colors.dart';
import '../../../themes/spaces.dart';
import '../../../themes/theme.dart';
import '../application/login_notifier.dart';

class LoginWidget extends HookConsumerWidget {
  const LoginWidget(
      {super.key, required this.maxHeight, required this.maxWidth});

  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummy = useState(false);

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final isShowError = useState(false);

    return Container(
      height: maxHeight / 1.25,
      width: maxWidth - 64,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 8,
            )
          ]),
      child: Form(
        key: _formKey,
        autovalidateMode: isShowError.value
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            largeSpace(),
            Text(
              'LOGIN',
              style: appThemeData.textTheme.titleMedium,
            ),
            largeSpace(),
            Text(
              'Email',
              style: appThemeData.textTheme.bodyMedium,
            ),
            smallSpace(),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: emailTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (item) {
                  if (item == null) {
                    return 'Email tidak boleh kosong';
                  } else if (item.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }

                  return null;
                },
              ),
            ),
            largeSpace(),
            Text(
              'Password',
              style: appThemeData.textTheme.bodyMedium,
            ),
            smallSpace(),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: passwordTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (item) {
                  if (item == null) {
                    return 'Password tidak boleh kosong';
                  } else if (item.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }

                  return null;
                },
              ),
            ),
            mediumSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: dummy.value,
                    onChanged: (value) {
                      dummy.value = value ?? false;
                    },
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Remember Me',
                  style: appThemeData.textTheme.bodyMedium,
                ),
              ],
            ),
            mediumSpace(),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  isShowError.value = false;

                  ref.read(loginNotifierProvider.notifier).login();
                }

                isShowError.value = true;
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              child: Ink(
                height: 45,
                width: maxWidth,
                decoration: BoxDecoration(
                    color: Palette.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ]),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: appThemeData.textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            smallSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    return AlertHelper.showSnackBar(
                      context,
                      message: 'Fitur ini belum ada ya. Terimakasih 🙏',
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: appThemeData.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
            largeSpace(),
            Container(
              height: 35,
              width: maxWidth,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Divider(
                      color: Palette.subtitleColor,
                      height: 1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Palette.subtitleColor,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('OR'),
                    ),
                  ),
                ],
              ),
            ),
            mediumSpace(),
            SocialMediaWidget(),
            largeSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Need an account? ',
                  style: appThemeData.textTheme.bodyMedium,
                ),
                Text(
                  'SIGN UP',
                  style: appThemeData.textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
