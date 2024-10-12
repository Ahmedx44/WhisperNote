import 'package:WhisperNote/data/model/post/post_model.dart';
import 'package:WhisperNote/data/source/post/post_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:dartz/dartz.dart';

class PostUsecase {
  Future<Either<String, String>> call(PostModel postModel) {
    return sl<PostService>().postmessage(postModel);
  }
}
