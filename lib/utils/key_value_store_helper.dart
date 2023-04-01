import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStoreHelper {

  static final KeyValueStoreHelper _instance = KeyValueStoreHelper._internal();
  SharedPreferences? _prefs;

  KeyValueStoreHelper._internal();

  factory KeyValueStoreHelper() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set secretKey(value) {
    _prefs?.setString("SECRET_KEY", value);
  }
  String? get secretKey {
    return _prefs?.getString("SECRET_KEY");
  }
}