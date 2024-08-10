// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserData extends UserEvent {
  final String userUID;

  const LoadUserData({
    required this.userUID,
  });

  @override
  List<Object> get props => [userUID];
}

class UpdateUserData extends UserEvent {
  final UserModel user;

  const UpdateUserData({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UpdateUserStats extends UserEvent {
  final FoodLabel label;

  const UpdateUserStats({required this.label});

  @override
  List<Object> get props => [label];
}
