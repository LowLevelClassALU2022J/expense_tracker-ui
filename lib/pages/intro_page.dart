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
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/main'); // Navigate to main screen
            },
            child: const Text('Get Started'),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // add some space
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Navigate to login screen
            },
            child: const Text('Already have an account? Log In'),
            // text should be the primary color
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
