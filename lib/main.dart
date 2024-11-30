import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:memorie_note_taking_app/screens/login.dart';
import 'package:memorie_note_taking_app/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Memorie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/main": (context) => MainScreen()
      },
    ),
  ));
}
