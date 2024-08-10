// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  const SignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUp extends AuthEvent {
  final String email;
  final String password;

  const SignUp({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthEvent {}

class RefreshPassword extends AuthEvent {
  final String email;

  const RefreshPassword({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class CheckUser extends AuthEvent {}
