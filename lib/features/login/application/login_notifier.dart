import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_notifier.g.dart';

const loginKey = 'IS_LOGGED_IN';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginKey) ?? false;
  }

  login() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool(loginKey, true);

      return true;
    });
  }
}
