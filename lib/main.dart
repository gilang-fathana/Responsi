import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/prof.dart';
import 'package:flutter_basic/screens/home_screen.dart';
import 'package:flutter_basic/screens/login_screen.dart';
import 'package:flutter_basic/screens/profile_screen.dart';
import 'package:flutter_basic/screens/lupa_sandi.dart';
import 'package:flutter_basic/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/lupa_sandi': (context) => const LupaSandiScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
