import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/moduls/users_model.dart';
import 'package:perfection/single_user/single_user_bloc/user_bloc.dart';
import 'package:perfection/single_user/single_user_bloc/user_event.dart';
import 'package:perfection/single_user/single_user_bloc/user_state.dart';
import 'package:perfection/single_user/single_user_repositiry/user_repositiry.dart';
import 'package:perfection/utilites/app_colors.dart';
import 'widgets/photo_container.dart';
import 'widgets/user_item.dart';

class ProfileScreen extends StatelessWidget {
  final String id;
  const ProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Center(child: Text('USER')),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(userRepositiry: UserRepositiry())
          ..add(FetchUserEvent(userId: id)),
        child: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoaded) {
                User user = state.user;

                return UserProfile(user: user);
              } else if (state is UserError) {
                return Center(child: Text('Error: ${state.error}'));
              }
              return const Center(child: Text('No Data'));
            },
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfilePhoto(photoUrl: user.avatar), // عرض صورة المستخدم
        Expanded(
          child: ListView(
            children: <Widget>[
              ProfileListItem(
                icon: Icons.verified_user,
                text:
                    '${user.firstName} ${user.lastName}', // عرض الاسم الكامل للمستخدم
              ),
              ProfileListItem(
                icon: Icons.mail,
                text: user.email, // عرض البريد الإلكتروني
              ),
            ],
          ),
        ),
      ],
    );
  }
}
