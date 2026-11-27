
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  // Handles authentication operations through the repository.
  final AuthRepository _authRepository;

  // Subscribes to Firebase authentication state changes.
  StreamSubscription<UserEntity?>? _authSubscription;

  // Stores the currently authenticated user.
  UserEntity? _currentUser;

  // Tracks whether an authentication request is running.
  bool _isLoading = false;

  // Stores authentication error messages.
  String? _errorMessage;

  // Receives the repository and starts listening to auth changes.
  AuthProvider(this._authRepository) {
    _listenToAuthChanges();
  }

  // Provides read-only access to the current user.
  UserEntity? get currentUser => _currentUser;

  // Provides the current loading state.
  bool get isLoading => _isLoading;

  // Provides the current error message.
  String? get errorMessage => _errorMessage;

  // Checks whether a user is currently authenticated.
  bool get isAuthenticated => _currentUser != null;

  // Listens to authentication state changes.
  void _listenToAuthChanges() {
    _authSubscription = _authRepository.authStateChanges().listen(
      (user) {
        _currentUser = user;
        notifyListeners();
      },
      onError: (error) {
        _errorMessage = error.toString();
        notifyListeners();
      },
    );
  }

  // Updates the loading state and notifies listeners.
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Clears the previous error message.
  void _clearError() {
    _errorMessage = null;
  }

  // Registers a new user with email and password.
  Future<void> registerWithEmail({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      _currentUser = await _authRepository.registerWithEmail(
        email: email,
        password: password,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // Signs in an existing user with email and password.
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      _currentUser = await _authRepository.signInWithEmail(
        email: email,
        password: password,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // Signs in a user as a guest.
  Future<void> signInAsGuest() async {
    _setLoading(true);
    _clearError();

    try {
      _currentUser = await _authRepository.signInAsGuest();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // Signs out the current user.
  Future<void> signOut() async {
    _setLoading(true);
    _clearError();

    try {
      await _authRepository.signOut();
      _currentUser = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  // Cancels the authentication subscription when the provider is disposed.
  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
