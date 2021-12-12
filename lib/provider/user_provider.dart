import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var role;
  Future<String> currentRole() async {
    final SharedPreferences prefs = await _prefs;
    role = prefs.getString("role");
    print(role);
    return role;
  }

  Future<void> change_role(String new_role) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("role", new_role);
    notifyListeners();
  }
}
