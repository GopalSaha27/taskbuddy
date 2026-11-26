import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensures Flutter is initialized before Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Firebase.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Starts the TaskBuddy application.
  runApp(const TaskBuddyApp());
}