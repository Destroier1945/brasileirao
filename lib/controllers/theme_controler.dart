import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ThemeController extends GetxController {
  var isDark = false.obs;

  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };

  static ThemeController get to => Get.find();

  loadThemeMode() async {
    if (!kIsWeb) {
      Directory? appDocumentsDir;
      if (Platform.isAndroid) {
        appDocumentsDir = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        appDocumentsDir = await getApplicationDocumentsDirectory();
      }

      if (appDocumentsDir != null) {
        Hive.init(appDocumentsDir.path);
        var box =
            await Hive.openBox('preferencias', path: appDocumentsDir.path);
        String themeText = box.get('theme') ?? 'light';
        isDark.value = themeText == 'dark' ? true : false;
        setMode(themeText);
      }
    }
  }

  Future setMode(String themeText) async {
    ThemeMode? themeMode = themeModes[themeText];
    Get.changeThemeMode(themeMode!);

    if (!kIsWeb) {
      Directory? appDocumentsDir;
      if (Platform.isAndroid) {
        appDocumentsDir = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        appDocumentsDir = await getApplicationDocumentsDirectory();
      }

      if (appDocumentsDir != null) {
        var box =
            await Hive.openBox('preferencias', path: appDocumentsDir.path);
        await box.put('theme', themeText);
      }
    }
  }

  changeTheme() {
    setMode(isDark.value ? 'light' : 'dark');
    isDark.value = !isDark.value;
  }
}
