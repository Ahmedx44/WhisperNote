import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class GetUserUseCase {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>> call() {
    return sl<AuthFirebaseService>().getUser();
  }
}
