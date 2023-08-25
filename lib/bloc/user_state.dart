part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> usersList;

  UserLoadedState({required this.usersList});
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}
