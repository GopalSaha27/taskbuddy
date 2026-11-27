
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),
          child: Column(
            children: [
              const Spacer(),

              // Application icon.
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.task_alt_rounded,
                  size: 58,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 32),

              // Application name.
              const Text(
                'TaskBuddy',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),

              const SizedBox(height: 12),

              // Welcome description.
              const Text(
                'Organize your tasks, manage your time, '
                'and achieve more every day.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColors.secondaryText,
                ),
              ),

              const Spacer(),

              // Navigates to the Login Screen.
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 14),

              // Navigates to the Registration Screen.
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text('Create Account'),
                ),
              ),

              const SizedBox(height: 20),

              // Guest authentication will be connected later.
              TextButton(
                onPressed: () {
                  // Guest authentication will be connected later.
                },
                child: const Text(
                  'Continue as Guest',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
