
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  // Provides access to Firebase Authentication operations.
  final AuthRemoteDataSource _remoteDataSource;

  // Receives the data source through dependency injection.
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Stream<UserEntity?> authStateChanges() {
    return _remoteDataSource.authStateChanges();
  }

  @override
  Future<UserEntity> registerWithEmail({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.registerWithEmail(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.signInWithEmail(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserEntity> signInAsGuest() async {
    return await _remoteDataSource.signInAsGuest();
  }

  @override
  UserEntity? getCurrentUser() {
    return _remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
  }
}
