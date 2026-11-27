import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  // Firebase Authentication instance.
  final FirebaseAuth _firebaseAuth;

  // Constructor with dependency injection.
  AuthRemoteDataSource(this._firebaseAuth);

  // Converts Firebase User into our application UserModel.
  UserModel _mapFirebaseUser(User user) {
    return UserModel.fromFirebase(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isGuest: user.isAnonymous,
    );
  }

  // Listens to authentication state changes.
  Stream<UserModel?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return null;
      }

      return _mapFirebaseUser(user);
    });
  }

  // Registers a new user using email and password.
  Future<UserModel> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _mapFirebaseUser(credential.user!);
  }

  // Signs in an existing user using email and password.
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _mapFirebaseUser(credential.user!);
  }

  // Creates an anonymous guest account.
  Future<UserModel> signInAsGuest() async {
    final credential = await _firebaseAuth.signInAnonymously();

    return _mapFirebaseUser(credential.user!);
  }

  // Returns the currently authenticated user, if available.
  UserModel? getCurrentUser() {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    return _mapFirebaseUser(user);
  }

  // Signs out the current user.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
