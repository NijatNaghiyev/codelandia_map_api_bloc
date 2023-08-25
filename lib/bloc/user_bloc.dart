import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserInitialEvent>(userInitialEvent);
    on<UserLoadingEvent>(userLoadingEvent);
    on<UserErrorEvent>(userErrorEvent);
  }

  Future<FutureOr<void>> userInitialEvent(
      UserInitialEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    var usersList1 = await userRepository.fetchData();
    if (usersList1 != null) {
      emit(UserLoadedState(usersList: usersList1));
    } else {
      emit(UserErrorState(errorMessage: 'UserList is NULL'));
    }
  }

  FutureOr<void> userLoadingEvent(
      UserLoadingEvent event, Emitter<UserState> emit) {
    emit(UserLoadingState());
  }

  FutureOr<void> userErrorEvent(UserErrorEvent event, Emitter<UserState> emit) {
    emit(UserErrorState(errorMessage: event.message));
  }
}
