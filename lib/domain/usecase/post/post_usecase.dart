import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/post/post_model.dart';
import 'package:wish_i_sent/data/source/post/post_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class PostUsecase {
  Future<Either<String, String>> call(PostModel postModel) {
    return sl<PostService>().postmessage(postModel);
  }
}
