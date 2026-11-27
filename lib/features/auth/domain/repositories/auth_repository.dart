
import '../entities/user_entity.dart';

abstract class AuthRepository {
  // Listens to authentication state changes.
  Stream<UserEntity?> authStateChanges();

  // Registers a new user with name, email and password.
  Future<UserEntity> registerWithEmail({
    required String displayName,
    required String email,
    required String password,
  });

  // Signs in an existing user using email and password.
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  });

  // Creates an anonymous guest account.
  Future<UserEntity> signInAsGuest();

  // Gets the currently authenticated user.
  UserEntity? getCurrentUser();

  // Signs out the current user.
  Future<void> signOut();
}
