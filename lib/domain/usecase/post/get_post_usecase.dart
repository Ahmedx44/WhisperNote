import 'package:WhisperNote/data/source/post/post_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class GetPostUsecase {
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> call() {
    return sl<PostService>().getAllPost();
  }
}
