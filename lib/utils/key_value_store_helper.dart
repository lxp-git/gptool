import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:gptool/models/export.dart' as models;

class KeyValueStoreHelper {
  static final KeyValueStoreHelper _instance = KeyValueStoreHelper._internal();
  late SharedPreferences _prefs;

  KeyValueStoreHelper._internal();

  factory KeyValueStoreHelper() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set secretKey(value) {
    _prefs.setString("SECRET_KEY", value);
  }

  String? get secretKey {
    return _prefs.getString("SECRET_KEY");
  }

  set chatGPTNextWebConfiguration(models.ChatGPTNextWeb? value) {
    _prefs.setString(
        "CHAT_GPT_NEXT_WEB_CONFIGURATION", jsonEncode(value?.toJson()));
  }

  models.ChatGPTNextWeb? get chatGPTNextWebConfiguration {
    String? d = _prefs.getString("CHAT_GPT_NEXT_WEB_CONFIGURATION");
    if (d != null) {
      return models.ChatGPTNextWeb.fromJson(jsonDecode(d));
    }
    return null;
  }
}
