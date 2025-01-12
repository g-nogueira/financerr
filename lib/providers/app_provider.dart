import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../dao/user_dao.dart';
import '../models/user.dart';

final getIt = GetIt.instance;

class AppProvider with ChangeNotifier {
  final UserDao _userDao = getIt<UserDao>();

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> loadUsers() async {
    _users = await _userDao.getUsers();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await _userDao.insertUser(user);
    await loadUsers();
  }
}