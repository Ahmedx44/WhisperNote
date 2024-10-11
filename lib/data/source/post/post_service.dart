import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wish_i_sent/data/model/post/post_model.dart';

abstract class PostService {
  Future<Either<String, String>> postmessage(PostModel postModel);
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>> getAllPost();
}

class PostServiceImpl extends PostService {
  final user = FirebaseAuth.instance.currentUser;
  final firebasefirestore = FirebaseFirestore.instance;

  @override
  Future<Either<String, String>> postmessage(PostModel postModel) async {
    try {
      await firebasefirestore
          .collection('messages')
          .doc(Timestamp.now().toString())
          .set({
        'UseriD': postModel.userId,
        'color': postModel.color,
        'name': postModel.name,
        'category': postModel.category,
        'message': postModel.message,
        'type': postModel.type,
        'likes': postModel.likes,
        'key': postModel.key
      });

      return const Right('Your post Succesffully made');
    } catch (e) {
      return const Left('Something went wrong,Please try again');
    }
  }

  @override
  Future<Either<String, QuerySnapshot<Map<String, dynamic>>>>
      getAllPost() async {
    try {
      final result = await firebasefirestore.collection('messages').get();
      return Right(result);
    } catch (e) {
      return const Left('Something went wrong');
    }
  }
}
