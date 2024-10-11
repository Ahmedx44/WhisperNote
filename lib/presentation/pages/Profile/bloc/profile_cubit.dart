import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wish_i_sent/domain/usecase/auth/get_user.dart';
import 'package:wish_i_sent/presentation/pages/Profile/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase getUserUseCase;

  ProfileCubit(this.getUserUseCase) : super(ProfileStateInitial());

  getUserProfile() {
    emit(ProfileStateLoading());

    // Pass the future result directly in ProfileStateLoaded
    final result = getUserUseCase();
    emit(ProfileStateLoaded(user: result));
  }
}
