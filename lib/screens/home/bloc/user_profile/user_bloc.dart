import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:expense_repositories/src/repository/user_profile/user_profile_repository.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUser>(_onGetUser);
    on<UpdateUser>(_onUpdateUser);
  }

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await userRepository.getUser(event.uid!);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    try {
      await userRepository.updateUser(event.userProfile);
      emit(UserLoaded(event.userProfile));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

}

