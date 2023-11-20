import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_service.dart';
import 'package:flutter_fire_chat_app/screens/chat_screen.dart';
import 'package:flutter_fire_chat_app/screens/login_screen.dart';
import 'package:flutter_fire_chat_app/screens/registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterfire Chats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 15),
            ),
            fixedSize: MaterialStateProperty.all<Size>(const Size(500, 50)),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Colors.yellow,
        ),
      ),
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? '/chats' : '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/chats': (context) => const ChatsScreen(),
      },
    );
  }
}
