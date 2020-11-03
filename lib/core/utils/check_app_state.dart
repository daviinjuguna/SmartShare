import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class CheckAppState {
  final SharedPreferences sharedPreferences;

  CheckAppState({@required this.sharedPreferences});

  Future<bool> userLoggedIn() async {
    final authToken = sharedPreferences.getString("access_token");
    if (authToken != null) {
      return true;
    } else {
      return false;
    }
  }
}
