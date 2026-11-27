import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Manages the login form.
  final _formKey = GlobalKey<FormState>();

  // Reads the email input.
  final _emailController = TextEditingController();

  // Reads the password input.
  final _passwordController = TextEditingController();

  // Controls password visibility.
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validates the form before login.
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Firebase login will be connected in the next step.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form validation successful!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),

                // Login heading.
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Sign in to continue using TaskBuddy.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.secondaryText,
                  ),
                ),

                const SizedBox(height: 40),

                // Email label.
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),

                const SizedBox(height: 10),

                // Email input field.
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!RegExp(
                      r'^[\w\.-]+@[\w\.-]+\.\w+$',
                    ).hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Password label.
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),

                const SizedBox(height: 10),

                // Password input field.
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // Forgot password placeholder.
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Password reset will be implemented later.
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Login button.
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Registration navigation placeholder.
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Registration navigation will be added later.
                    },
                    child: const Text(
                      "Don't have an account? Create Account",
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
