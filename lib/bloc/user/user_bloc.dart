import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/data/models/food_label_model.dart';
import '/data/models/user_model.dart';

import '../../data/controllers/user/user_controller.dart';
import '../../data/repository/activity_repository/activity_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserController _userController;
  final ActivityRepository _activityRepository;

  UserBloc(
      {UserController? userController, ActivityRepository? activityRepository})
      : _userController = userController ?? UserController(),
        _activityRepository = activityRepository ?? ActivityRepository(),
        super(UserInitial()) {
    on<LoadUserData>(_load);
    on<UpdateUserData>(_update);
    on<UpdateUserStats>(_updateStats);
  }

  FutureOr<void> _load(LoadUserData event, Emitter<UserState> emit) async {
    try {} catch (error) {
      emit(UserError(error: error.toString()));
    }
  }

  FutureOr<void> _update(UpdateUserData event, Emitter<UserState> emit) async {
    try {
      emit(UpdatingUserData());
      await _userController.updateUserData(user: event.user);
      emit(UserDataUpdated());
    } catch (error) {
      emit(UserError(error: error.toString()));
    }
  }

  FutureOr<void> _updateStats(
      UpdateUserStats event, Emitter<UserState> emit) async {
    try {
      emit(UpdatingUserStats());
      UserModel user = UserModel.fromSharedPreferences();
      await _activityRepository.updateStats(event.label);
      await _activityRepository.updateDay();
      await _userController.updateUserStats(user: user);
      emit(UserStatsUpdated());
    } catch (error) {
      emit(UserError(error: error.toString()));
    }
  }
}
