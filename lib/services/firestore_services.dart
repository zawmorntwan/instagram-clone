import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';
import 'storage_services.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload post
  Future<String> uploadPost({
    required String uId,
    required String description,
    required Uint8List file,
    required String userName,
    required String profileImageUrl,
  }) async {
    String response = "Some error occured";
    try {
      // Upload post photo
      String photoUrl = await StorageService().uploadImageToStorage(
        childName: 'posts',
        file: file,
        isPost: true,
      );

      // Set post id
      String postId = const Uuid().v1();

      // Create post
      Post post = Post(
        uId: uId,
        userName: userName,
        postId: postId,
        description: description,
        profileImageUrl: profileImageUrl,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        likes: [],
      );

      // Upload post
      await _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );

      response = 'Success';
    } catch (err) {
      response = err.toString();
    }
    return response;
  }
}
