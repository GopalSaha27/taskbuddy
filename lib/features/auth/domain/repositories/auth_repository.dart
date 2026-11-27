
import '../entities/user_entity.dart';

abstract class AuthRepository {
  // Listens to authentication state changes.
  Stream<UserEntity?> authStateChanges();

  // Registers a new user with email and password.
  Future<UserEntity> registerWithEmail({
    required String email,
    required String password,
  });

  // Signs in an existing user with email and password.
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  });

  // Signs in a user as a guest.
  Future<UserEntity> signInAsGuest();

  // Returns the currently authenticated user.
  UserEntity? getCurrentUser();

  // Signs out the current user.
  Future<void> signOut();
}
