import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/post/post_model.dart';

abstract class PostRepository {
  Future<Either<String, String>> postmessage(PostModel postModel);
}
