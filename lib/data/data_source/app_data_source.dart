import '../models/guard/user_model.dart';

abstract class AppDataSource {
  Future<dynamic> login({required String email, required String password});

  Future<dynamic> register(
      {required String fullName,
        required String emailId,
        required String password});

  Future<User> getUserById();

  Future<bool> logout();

  Future<void> deleteUserSession();

  Future<void> setUserSession({required User userDataModel});

  Future<User?> getUserSession();

}

