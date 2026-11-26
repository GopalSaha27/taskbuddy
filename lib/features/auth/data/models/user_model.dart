
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  // Constructor for creating a UserModel object.
  const UserModel({
    required super.uid,
    super.email,
    super.displayName,
    super.photoUrl,
    required super.isGuest,
  });

  // Creates a UserModel from Firebase user data.
  factory UserModel.fromFirebase({
    required String uid,
    String? email,
    String? displayName,
    String? photoUrl,
    required bool isGuest,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      isGuest: isGuest,
    );
  }
}
