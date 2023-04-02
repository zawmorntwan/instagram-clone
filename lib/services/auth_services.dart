// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'storage_services.dart';
import '/models/user.dart' as model;

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get user detail
  Future<model.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // Sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String response = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // upload user photo
        String photoUrl = await StorageService().uploadImageToStorage(
          childName: 'profilePics',
          file: file,
          isPost: false,
        );

        // add user to firestore database
        model.User user = model.User(
          uId: credential.user!.uid,
          userName: userName,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(credential.user!.uid).set(
              user.toJson(),
            );

        response = 'success';
      }
    } catch (err) {
      response = err.toString();
    }
    return response;
  }

  // Logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String response = 'Some error occured';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        response = 'Success';
      } else {
        response = 'Please enter all the field';
      }
    } catch (err) {
      response = err.toString();
    }

    return response;
  }
}
