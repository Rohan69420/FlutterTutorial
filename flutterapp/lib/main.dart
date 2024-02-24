import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/firebase_options.dart';
import 'package:flutterapp/widgets/calendar_widget.dart';
import 'pages/menu_page.dart';
import 'pages/intro_page.dart';
import 'pages/scan_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/menupage': (context) => const MenuPage(),
          '/scanpage': (context) => const ScanPage(),
          '/calendarpage': (context) => const CalendarPage(),
        }); //
  }
}
