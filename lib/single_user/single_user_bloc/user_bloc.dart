import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/single_user/single_user_repositiry/user_repositiry.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositiry userRepositiry;

  UserBloc({required this.userRepositiry}) : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepositiry.fetchUserById(event.userId);
        emit(UserLoaded(user: user));
      } catch (e) {
        emit(UserError(error: e.toString()));
      }
    });
  }
}
