import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/firebase_options.dart';
import 'package:dalil_app/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

@override
void initState() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: Styles.textThemes,
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
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const HomePage(),
    );
  }
}
