import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:data_handel/models/user_model.dart';

class CacheHelper {
  static const String _viewedUsersKey = 'viewed_users';
  static Future<void> saveViewedUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final viewedUsers = await getViewedUsers();

    //to check if the user already exists in the cache to prevent duplecated users
    final userExists = viewedUsers.any((u) => u.id == user.id);

    if (!userExists) {
      viewedUsers.add(user);
      final userJson = viewedUsers.map((e) => e.toJson()).toList();
      await prefs.setString(_viewedUsersKey, json.encode(userJson));
    }
  }

  //to retrieve all viewed users from cache
  static Future<List<User>> getViewedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_viewedUsersKey);
    if (userJson != null) {
      final List<dynamic> decoded = json.decode(userJson);
      return decoded.map((e) => User.fromJson(e)).toList();
    }
    return [];
  }

  //to clear the cache (remove all viewed users)
  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_viewedUsersKey);
  }
}
