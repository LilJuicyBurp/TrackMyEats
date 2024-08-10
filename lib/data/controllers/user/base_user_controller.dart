import '/data/models/user_model.dart';

abstract class BaseUserController {
  bool checkUser();

  Future<void> signInUser({required String email, required String passwd});

  Future<void> signUpUser({required String email, required String passwd});

  Future<void> signOutUser();

  Future<void> resetUserPassword({required String email});

  Future<void> updateUserData({required UserModel user});

  Future<void> updateUserStats({required UserModel user});
}
