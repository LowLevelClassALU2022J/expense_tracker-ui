import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: const Color(0xFF429690),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'First Name'),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'last Name'),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle signup
                final email = emailController.text;
                final password = passwordController.text;
                final confirmPassword = confirmPasswordController.text;

                if (password == confirmPassword) {
                  // Proceed with signup
                  print('Proceeding with signup: $email, $password');
                } else {
                  // Show error
                  print('Passwords do not match');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF429690),
              ),
              child: const Text('Signup'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
              label: const Text('Continue with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF429690),
              ),
              onPressed: () {
                // Handle Google Sign-Up
              },
            ),
          ],
        ),
      ),
    );
  }
}
