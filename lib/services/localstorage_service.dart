import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tinread_rfid_scanner/models/user_model.dart' show User;

class LocalStorage {
  LocalStorage._();

  static late FlutterSecureStorage secureStorage;

  static Future<void> init() async {
    secureStorage = FlutterSecureStorage();
  }

  // -- SECURE STORAGE

  static Future<User?> getUserDetails() async {
    String? userDetails = await secureStorage.read(key: "user");

    if (userDetails == null) {
      return null;
    }

    return User.fromJson(jsonDecode(userDetails));
  }

  static Future<void> saveUserDetails(User user) async {
    await secureStorage.write(key: "user", value: jsonEncode(user));
  }

  static Future<void> deleteUserDetails() async {
    await secureStorage.delete(key: "user");
  }
}
