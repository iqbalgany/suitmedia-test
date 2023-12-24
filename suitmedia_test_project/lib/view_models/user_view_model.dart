import 'package:flutter/material.dart';
import 'package:suitmedia_test_project/models/user_model.dart';
import 'package:suitmedia_test_project/services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _user;

  set user(UserModel? user) {
    if (_user == user) {
      _user = null;
    } else {
      _user = user;
    }

    notifyListeners();
  }

  UserModel? get user => _user;

  Future? userFuture;

  bool _isLoading = true;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<List<UserModel>> getUserData() async {
    final userService = UserService();
    final users = await userService.getUserData();

    isLoading = false;

    this.users = users;

    page = 1;
    return await userService.getUserData();
  }

  int _page = 1;

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  int get page => _page;

  List<UserModel> _users = [];

  set users(List<UserModel> users) {
    _users = users;
    notifyListeners();
  }

  List<UserModel> get users => _users;
}
