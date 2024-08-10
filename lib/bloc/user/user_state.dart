// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoadungUserData extends UserState {}

class UserDataLoaded extends UserState {}

class UpdatingUserData extends UserState {}

class UserDataUpdated extends UserState {}

class UpdatingUserStats extends UserState {}

class UserStatsUpdated extends UserState {}

class UserError extends UserState {
  final String error;

  const UserError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
