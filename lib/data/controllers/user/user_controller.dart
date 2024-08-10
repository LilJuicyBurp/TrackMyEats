import '/data/models/user_model.dart';
import '/data/repository/firbase/auth_repository.dart';
import '/data/repository/model_repository/user_repository/user_repository.dart';
import '/utils/user_shared_preferences.dart';

import 'base_user_controller.dart';

class UserController extends BaseUserController {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  @override
  bool checkUser() {
    try {
      return _authRepository.checkUser();
    } catch (error) {
      throw Exception(error);
    }
  }

  UserController(
      {AuthRepository? authRepository, UserRepository? userRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        _userRepository = userRepository ?? UserRepository();

  @override
  Future<void> signInUser(
      {required String email, required String passwd}) async {
    try {
      await _authRepository.signIn(email: email, passwd: passwd);
      final userUID = await _authRepository.getUID();
      _userRepository.getUser(userUID!).listen((user) async {
        await _userRepository.saveUser(user);
        await UserSharedPreferences.setLastLoggedIn(
            DateTime.now().millisecondsSinceEpoch);
      });
      await _userRepository.getUserStats(userUID).first.then((stats) {
        if (stats.isNotEmpty) {
          UserSharedPreferences.setStats(stats);
        } else {
          _userRepository.initUserStats(userUID);
        }
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signUpUser(
      {required String email, required String passwd}) async {
    try {
      final userUID =
          await _authRepository.signUp(email: email, passwd: passwd);
      await _userRepository.initUserDocument(userUID!);
      await _authRepository.signIn(email: email, passwd: passwd);
      await UserSharedPreferences.setLastLoggedIn(
          DateTime.now().millisecondsSinceEpoch);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOutUser() async {
    try {
      await _authRepository.signOut();
      await UserSharedPreferences.clearAllUserData();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> resetUserPassword({required String email}) async {
    try {
      await _authRepository.resetPasswd(email: email);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateUserData({required UserModel user}) async {
    try {
      await _userRepository.updateUserData(user);
      await _userRepository.saveUser(user);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateUserStats({required UserModel user}) async {
    try {
      await _userRepository.updateUserStats(user);
    } catch (error) {
      throw Exception(error);
    }
  }
}
