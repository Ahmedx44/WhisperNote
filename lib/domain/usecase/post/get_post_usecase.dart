import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/source/post/post_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class GetPostUsecase {
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> call() {
    return sl<PostService>().getAllPost();
  }
}
