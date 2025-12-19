import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const JantarMantarApp());
}

class JantarMantarApp extends StatelessWidget {
  const JantarMantarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jantar Mantar Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
