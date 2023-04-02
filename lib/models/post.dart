// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String uId;
  final String userName;
  final String postId;
  final String description;
  final String profileImageUrl;
  final datePublished;
  final String postUrl;
  final likes;

  const Post({
    required this.uId,
    required this.userName,
    required this.postId,
    required this.description,
    required this.profileImageUrl,
    required this.datePublished,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        "userId": uId,
        "userName": userName,
        "postId": postId,
        "description": description,
        "profileImageUrl": profileImageUrl,
        'datePublished': datePublished,
        "postUrl": postUrl,
        "likes": likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return Post(
      uId: snapShot['uId'],
      userName: snapShot['userName'],
      postId: snapShot['email'],
      description: snapShot['bio'],
      profileImageUrl: snapShot['profileImageUrl'],
      datePublished: snapShot['datePublished'],
      postUrl: snapShot['postUrl'],
      likes: snapShot['likes'],
    );
  }
}
