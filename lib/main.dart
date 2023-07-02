import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock/wakelock.dart';
import 'package:zen_clock/Main/homescreen.dart';

void main() {
  runApp(const BeginApp());
}

class BeginApp extends StatefulWidget {
  const BeginApp({super.key});

  @override
  State<BeginApp> createState() => _BeginAppState();
}

class _BeginAppState extends State<BeginApp> {
  @override
  void initState() {
    Wakelock.enable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.lexendTextTheme().apply(),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.lexendTextTheme().apply(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
