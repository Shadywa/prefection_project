import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection/all_users/all_users_bloc/users_bloc.dart';
import 'package:perfection/all_users/all_users_repositry/users_repo.dart';
import 'package:perfection/single_user/single_user_bloc/user_bloc.dart';
import 'package:perfection/single_user/single_user_repositiry/user_repositiry.dart';
import 'package:perfection/start.dart/start.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepositiry: UserRepositiry()),
        ),
        BlocProvider(
          create: (context) => UsersBloc(UsersRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'prefecttion',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StartScreen(),
      ),
    );
  }
}
