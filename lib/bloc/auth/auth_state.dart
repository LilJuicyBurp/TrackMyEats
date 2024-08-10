// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LogginIn extends AuthState {}

class LoggedIn extends AuthState {}

class CreatingAccount extends AuthState {}

class AccountCreated extends AuthState {}

class SendingRefreshEmail extends AuthState {}

class RefreshEmailSend extends AuthState {}

class SigningOut extends AuthState {}

class SignedOut extends AuthState {}

class CheckinUser extends AuthState {}

class UserIsAvailable extends AuthState {}

class NoUser extends AuthState {}

class AuthError extends AuthState {
  final String error;

  const AuthError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
