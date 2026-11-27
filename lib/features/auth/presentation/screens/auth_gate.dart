
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/presentation/screens/home_screen.dart';
import '../providers/auth_provider.dart';
import 'welcome_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Get authentication state from AuthProvider.
    final authProvider = context.watch<AuthProvider>();

    // Show loading screen while Firebase checks authentication.
    if (authProvider.isInitializing) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show Home Screen if the user is authenticated.
    if (authProvider.isAuthenticated) {
      return const HomeScreen();
    }

    // Show Welcome Screen if the user is not authenticated.
    return const WelcomeScreen();
  }
}
