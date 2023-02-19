import 'package:dalil_app/firebase_options.dart';
import 'package:dalil_app/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Tajawal'),
          headline6: TextStyle(fontFamily: 'Tajawal'),
          headline5: TextStyle(fontFamily: 'Tajawal'),
        ),
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AR'),
        Locale('en', 'EN'),
      ],
      fallbackLocale: const Locale('ar', 'AR'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
