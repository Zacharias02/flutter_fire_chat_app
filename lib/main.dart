import 'package:flutter/material.dart';

Future<void> main() async {
  //TODO (1): Initialize Firebase
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
      //TODO (2): Remove home and add routes your initial route.
      home: const Scaffold(body: Placeholder()),
    );
  }
}
