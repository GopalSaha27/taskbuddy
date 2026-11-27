
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth;

import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';

class TaskBuddyApp extends StatelessWidget {
  const TaskBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provides Firebase Authentication data source.
        Provider<AuthRemoteDataSource>(
          create: (_) => AuthRemoteDataSource(
            FirebaseAuth.instance,
          ),
        ),

        // Provides the authentication repository.
        ProxyProvider<AuthRemoteDataSource, AuthRepositoryImpl>(
          update: (_, dataSource, _) {
            return AuthRepositoryImpl(dataSource);
          },
        ),

        // Provides authentication state management.
        ChangeNotifierProxyProvider<AuthRepositoryImpl, AuthProvider>(
          create: (context) => AuthProvider(
            context.read<AuthRepositoryImpl>(),
          ),
          update: (_, repository, previousProvider) {
            return previousProvider ?? AuthProvider(repository);
          },
        ),
      ],
      child: MaterialApp(
        title: 'TaskBuddy',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,

        // Displays the welcome screen when the app starts.
        home: const WelcomeScreen(),
      ),
    );
  }
}
