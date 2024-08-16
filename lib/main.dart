import 'package:flutter/material.dart';
import 'package:todfy/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  
  String? errorMessage;

  try {
    // Initialize Hive and open the box before running the app
    await Hive.initFlutter();
    var box = await Hive.openBox("todo");
  } catch (e) {
    errorMessage = e.toString();  // Capture the error message
  }

  runApp(MyApp(errorMessage: errorMessage));
}

class MyApp extends StatelessWidget {
  final String? errorMessage;

  const MyApp({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: errorMessage == null ? const Homepage() : ErrorScreen(errorMessage: errorMessage!),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "An error occurred during initialization:\n\n$errorMessage",
            style: const TextStyle(color: Colors.red, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
