class AppConstants {
  // Private constructor to prevent object creation //
  AppConstants._();

  // Application name //
  static const String appName = 'TaskBuddy';

  // Local database file name //
  static const String databaseName = 'taskbuddy.db';

  // Current database version //
  static const int databaseVersion = 1;

  // Default priority assigned to a new task //
  static const String defaultTaskPriority = 'medium';
}