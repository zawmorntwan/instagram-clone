class User {
  final String uId;
  final String userName;
  final String email;
  final String password;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const User({
    required this.uId,
    required this.userName,
    required this.email,
    required this.password,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "userId": uId,
        "userName": userName,
        "email": email,
        "password": password,
        "bio": bio,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };
}
