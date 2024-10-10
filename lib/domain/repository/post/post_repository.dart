import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/post/post_model.dart';

abstract class PostRepository {
  Future<Either<String, String>> postmessage(PostModel postModel);
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getAllPost();
}
