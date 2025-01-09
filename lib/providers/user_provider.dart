// File: providers/user_provider.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  User? _currentUser;

  List<User> get users => _users;
  User? get currentUser => _currentUser;

  // Load users from a static JSON file
  Future<void> loadUsers() async {
    try {
      final String response = await rootBundle.loadString('assets/data/datauser.json');
      final List<dynamic> data = json.decode(response);
      _users = data.map((json) => User.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to load users: $error');
    }
  }

  // Authenticate user by email and password
  bool authenticate(String email, String password) {
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.id == password,
        orElse: () => throw Exception('User not found or invalid credentials'),
      );
      _currentUser = user;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  // Log out the current user
  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  // Register a new user
  void registerUser(User newUser) {
    _users.add(newUser);
    notifyListeners();
  }
}
