import 'package:cloud_firestore/cloud_firestore.dart';
import '/data/models/user_model.dart';
import '/data/repository/model_repository/user_repository/base_user_repositoru.dart';
import '/utils/user_shared_preferences.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<UserModel> getUser(String userUID) {
    try {
      final userRef = _firestore.collection('user').doc(userUID);
      return userRef.snapshots().map((user) => UserModel.fromSnapshot(user));
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> initUserDocument(String userUID) async {
    try {
      final userRef = _firestore.collection('user').doc(userUID);
      await userRef.set({'login': ""});
      final statsRef = userRef.collection('stats').doc('stats');
      final nullStats = List<String>.generate(7, (index) => super.nullStat);
      await statsRef.set({'stats': nullStats});
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> initUserStats(String userUID) async {
    try {
      final statsRef = _firestore
          .collection('user')
          .doc(userUID)
          .collection('stats')
          .doc('stats');
      final nullStats = List<String>.generate(7, (index) => super.nullStat);
      await statsRef.set({'stats': nullStats});
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateUserData(UserModel user) async {
    try {
      final userRef = _firestore.collection('user').doc(user.uid);
      await userRef.update(user.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateUserStats(UserModel user) async {
    try {
      final statsRef = _firestore
          .collection('user')
          .doc(user.uid)
          .collection('stats')
          .doc('stats');
      final userStats = UserSharedPreferences.getStats();
      await statsRef.update({'stats': userStats});
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Stream<List<String>> getUserStats(String userUID) {
    try {
      final statsRef = _firestore
          .collection('user')
          .doc(userUID)
          .collection('stats')
          .doc('stats');
      return statsRef.snapshots().map((stats) => stats['stats'].cast<String>());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    try {
      UserSharedPreferences.setUserUID(user.uid);
      if (user.gender != null) {
        UserSharedPreferences.setUserGender(user.gender!);
      }
      if (user.login != null) {
        UserSharedPreferences.setUserLogin(user.login!);
      }
      if (user.height != null) {
        UserSharedPreferences.setUserHeight(user.height!.toDouble());
      }
      if (user.weight != null) {
        UserSharedPreferences.setUserWeight(user.weight!.toDouble());
      }
      if (user.age != null) {
        UserSharedPreferences.setUserAge(user.age!.toInt());
      }
      if (user.pal != null) {
        UserSharedPreferences.setUserPAL(user.pal!.toDouble());
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
