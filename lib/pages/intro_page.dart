import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/intro.png'),
          Text(
            'Spend Smarter, Save More',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/main'); // Navigate to main screen
            },
            child: const Text('Get Started'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Navigate to login screen
            },
            child: const Text('Already have an account? Log In'),
          ),
        ],
      ),
    );
  }
}
