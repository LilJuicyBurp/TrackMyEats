import 'package:firebase_auth/firebase_auth.dart';
import '/data/repository/firbase/base_auth_repository.dart';
import '/utils/user_shared_preferences.dart';

class AuthRepository extends BaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  bool checkUser() {
    try {
      final firebaseUID = _firebaseAuth.currentUser?.uid;
      if (firebaseUID != null) {
        return firebaseUID == UserSharedPreferences.getUserUID();
      }
      return false;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String?> getUID() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user?.uid;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> resetPasswd({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signIn({required String email, required String passwd}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwd);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String?> signUp(
      {required String email, required String passwd}) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passwd);
      await UserSharedPreferences.setUserUID(user.user?.uid ?? "");
      return user.user?.uid;
    } catch (error) {
      throw Exception(error);
    }
  }
}
