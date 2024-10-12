import 'package:WhisperNote/data/model/post/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<String, String>> postmessage(PostModel postModel);
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getAllPost();
}
