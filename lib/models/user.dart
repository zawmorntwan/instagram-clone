import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uId;
  final String userName;
  final String email;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const User({
    required this.uId,
    required this.userName,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "userId": uId,
        "userName": userName,
        "email": email,
        "bio": bio,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return User(
      uId: snapShot['uId'],
      userName: snapShot['userName'],
      email: snapShot['email'],
      bio: snapShot['bio'],
      photoUrl: snapShot['photoUrl'],
      followers: snapShot['follwers'],
      following: snapShot['following'],
    );
  }
}
