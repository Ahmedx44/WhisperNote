import 'package:WhisperNote/data/source/auth/auth_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase {
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>> call() {
    return sl<AuthFirebaseService>().getUser();
  }
}
