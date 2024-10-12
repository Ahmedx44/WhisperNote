import 'package:WhisperNote/domain/usecase/auth/get_user.dart';
import 'package:WhisperNote/presentation/pages/Profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
