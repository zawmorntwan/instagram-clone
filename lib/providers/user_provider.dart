import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import '/models/user.dart';

class UserProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  User? _user;

  User? get getUser => _user;

  // Refresh user
  Future<void> refreshUser() async {
    User user = await _authServices.getUserDetail();
    _user = user;
    notifyListeners();
  }
}
