
class UserEntity {
  // Stores the unique user ID from Firebase Authentication.
  final String uid;

  // Stores the user's email address.
  final String? email;

  // Stores the user's display name.
  final String? displayName;

  // Stores the user's profile photo URL.
  final String? photoUrl;

  // Identifies whether the user is a guest.
  final bool isGuest;

  // Constructor for creating a UserEntity object.
  const UserEntity({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    required this.isGuest,
  });
}
