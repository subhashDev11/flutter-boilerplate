import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive/hive.dart';
import 'package:hyam_services/app/app_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app/app.dart';
import 'locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  final tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());
  final storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );
  setupLocator();

  HydratedBlocOverrides.runZoned(
        () =>
        runApp(
          EasyLocalization(
            path: 'assets/translations',
            supportedLocales: const [
              Locale('en'),
              Locale('hi'),
            ],
            fallbackLocale: const Locale('en'),
            useFallbackTranslations: true,
            child: const AppProvider(),
          ),
        ),
    storage: storage,
  );
}

