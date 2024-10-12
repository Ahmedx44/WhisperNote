import 'package:WhisperNote/domain/usecase/post/get_post_usecase.dart';
import 'package:WhisperNote/presentation/pages/home/bloc/post_bloc/post_state.dart';
import 'package:bloc/bloc.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostUsecase getPostUsecase;
  PostCubit(this.getPostUsecase) : super(PostStateIntit());

  void getAllPost() async {
    emit(PostStateLoading());
    final result = await getPostUsecase.call();
    emit(PostStateLoaded(posts: result));
  }
}
