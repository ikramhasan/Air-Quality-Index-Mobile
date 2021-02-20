import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeService {
  final GetStorage _getStorage = GetStorage();
  final String _storageKey = 'isDarkMode';

  bool isDarkMode() {
    return _getStorage.read(_storageKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(_storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isDarkMode());
  }
}
