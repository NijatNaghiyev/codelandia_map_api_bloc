import 'package:codelandia_map_api_bloc/model/user_model.dart';
import 'package:codelandia_map_api_bloc/service/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserBloc userBloc = UserBloc(userRepository: UserRepository());
  @override
  void initState() {
    super.initState();
    userBloc.add(UserInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Codelandia Map API Bloc'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case UserLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case UserLoadedState:
                final stateData = state as UserLoadedState;
                return ListView.builder(
                  itemCount: stateData.usersList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              NetworkImage(stateData.usersList[index].image),
                        ),
                        title: Text(
                            '${stateData.usersList[index].firstName} ${stateData.usersList[index].lastName}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Age: ${stateData.usersList[index].age}'),
                            const SizedBox(width: 10),
                            Icon(
                              stateData.usersList[index].gender == Gender.MALE
                                  ? Icons.male
                                  : Icons.female,
                              color: stateData.usersList[index].gender ==
                                      Gender.MALE
                                  ? Colors.blue
                                  : Colors.pink,
                            ),
                          ],
                        ),
                        subtitle: Text(
                            'Address: ${stateData.usersList[index].address.address}, City: ${stateData.usersList[index].address.city}'),
                      ),
                    );
                  },
                );
              case UserErrorState:
                final errorState = state as UserErrorState;
                return Center(
                  child: Text(errorState.errorMessage),
                );
              default:
                return const Center(
                  child: Text('default'),
                );
            }
          },
        ),
      ),
    );
  }
}
