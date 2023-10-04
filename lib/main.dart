import 'package:expense_tracker/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/pages/main_page.dart';
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/pages/intro_page.dart';
import 'package:expense_tracker/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkFirstOpen() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate a delay
    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    if (isFirstTime) {
      await prefs.setBool('first_time', false);
    }
    return isFirstTime;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: const Color(0xFF429690),
      ),
      initialRoute: '/', // This tells the app to start with the route named '/'
      routes: {
        '/': (context) => FutureBuilder<bool>(
              future: checkFirstOpen(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen(); // Show SplashScreen until future is resolved
                } else {
                  return snapshot.data == true
                      ? const IntroPage()
                      : const MainPage(); // Navigate to IntroScreen if it's the first time, else go to LoginScreen
                }
              },
            ),
        '/login': (context) => const LoginPage(),
        '/intro': (context) => const IntroPage(),
        '/main': (context) => const MainPage(),
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) => SignupPage(),
        '/settings': (context) =>
            const MainPage(), // Navigate to MainPage on settings
      },
    );
  }
}
