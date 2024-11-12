import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/all_users/all_users_bloc/users_event.dart';
import 'package:perfection/all_users/all_users_bloc/users_state.dart';
import 'package:perfection/all_users/all_users_repositry/users_repo.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository userRepository;

  UsersBloc(
    this.userRepository,
  ) : super(UsersInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final users = await userRepository.fetchUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}
