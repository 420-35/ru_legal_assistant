import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ru_legal_assistant/core/constants/app_constants.dart';
import 'package:ru_legal_assistant/di/injection.dart';
import 'package:ru_legal_assistant/presentation/screens/advocate_select/advocate_select_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация DI
  await configureDependencies();

  // Запрос разрешений при первом запуске
  await _requestPermissions();

  runApp(const LegalAssistantApp());
}

/// Запрашивает необходимые разрешения у пользователя
Future<void> _requestPermissions() async {
  // Микрофон — обязателен для голосового ввода
  final micStatus = await Permission.microphone.request();
  if (micStatus.isDenied) {
    // Можно показать диалог с пояснением, но для MVP — просто разрешаем
    await Permission.microphone.request();
  }

  // Хранилище — для сохранения диалогов (только Android)
  if (Platform.isAndroid) {
    final storageStatus = await Permission.storage.request();
    if (storageStatus.isDenied) {
      await Permission.storage.request();
    }
  }
}

/// Основное приложение
class LegalAssistantApp extends StatelessWidget {
  const LegalAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Material 3 (Material You)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Roboto',
      ),
      // Поддержка русского языка
      locale: const Locale('ru'),
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const AdvocateSelectScreen(),
    );
  }
}