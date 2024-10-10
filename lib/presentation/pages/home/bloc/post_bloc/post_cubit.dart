import 'package:bloc/bloc.dart';
import 'package:wish_i_sent/domain/usecase/post/get_post_usecase.dart';
import 'package:wish_i_sent/presentation/pages/home/bloc/post_bloc/post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostUsecase getPostUsecase;
  PostCubit(this.getPostUsecase) : super(PostStateIntit());

  void getAllPost() async {
    emit(PostStateLoading());
    final result = await getPostUsecase.call();
    emit(PostStateLoaded(posts: result));
  }
}
