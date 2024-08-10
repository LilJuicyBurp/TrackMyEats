import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/controllers/user/user_controller.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserController _userController;

  AuthBloc({UserController? userController})
      : _userController = userController ?? UserController(),
        super(AuthInitial()) {
    on<CheckUser>(_checkUser);
    on<SignIn>(_signIn);
    on<SignUp>(_signUp);
    on<SignOut>(_signOut);
    on<RefreshPassword>(_refreshPassword);
  }

  FutureOr<void> _checkUser(CheckUser event, Emitter<AuthState> emit) async {
    try {
      emit(CheckinUser());
      if (_userController.checkUser()) {
        emit(UserIsAvailable());
      } else {
        emit(NoUser());
      }
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      emit(LogginIn());
      await _userController.signInUser(
          email: event.email, passwd: event.password);
      emit(LoggedIn());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _signUp(SignUp event, Emitter<AuthState> emit) async {
    try {
      emit(CreatingAccount());
      await _userController.signUpUser(
          email: event.email, passwd: event.password);
      emit(AccountCreated());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _refreshPassword(
      RefreshPassword event, Emitter<AuthState> emit) async {
    try {
      emit(SendingRefreshEmail());
      _userController.resetUserPassword(email: event.email);
      emit(RefreshEmailSend());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }

  FutureOr<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      emit(SigningOut());
      await _userController.signOutUser();
      emit(SignedOut());
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }
}
