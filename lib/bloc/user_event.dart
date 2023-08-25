part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserInitialEvent extends UserEvent {}

class UserLoadingEvent extends UserEvent {}

class UserLoadedEvent extends UserEvent {}

class UserErrorEvent extends UserEvent {
  final String message;

  UserErrorEvent({required this.message});
}
