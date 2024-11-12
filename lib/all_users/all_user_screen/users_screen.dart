import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/all_users/all_users_bloc/users_bloc.dart';
import 'package:perfection/all_users/all_users_bloc/users_event.dart';
import 'package:perfection/all_users/all_users_bloc/users_state.dart';
import 'package:perfection/all_users/all_users_repositry/users_repo.dart';
import 'package:perfection/all_users/users_widget/user_card.dart';

class UsersPage extends StatelessWidget {
  final UsersRepository userRepository = UsersRepository();

  UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(userRepository)..add(FetchUsers()),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Center(child: Text('USERS LIST'))),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return UserCard(
                    user: user,
                  );
                },
              );
            } else if (state is UsersError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return const Center(child: Text('اضغط لجلب المستخدمين'));
            }
          },
        ),
      ),
    );
  }
}
