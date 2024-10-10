import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/post/post_model.dart';
import 'package:wish_i_sent/data/source/post/post_service.dart';
import 'package:wish_i_sent/domain/repository/post/post_repository.dart';
import 'package:wish_i_sent/service_provider.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<Either<String, String>> postmessage(PostModel postModel) {
    return sl<PostService>().postmessage(postModel);
  }

  @override
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getAllPost() {
    return sl<PostService>().getAllPost();
  }
}
