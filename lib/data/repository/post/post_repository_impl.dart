import 'package:WhisperNote/data/model/post/post_model.dart';
import 'package:WhisperNote/data/source/post/post_service.dart';
import 'package:WhisperNote/domain/repository/post/post_repository.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

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
