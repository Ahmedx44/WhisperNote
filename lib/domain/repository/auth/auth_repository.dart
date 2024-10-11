import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';
import 'package:wish_i_sent/data/model/auth/signup_model.dart';

abstract class AuthRepository {
  Future<Either<String, String>> signin(SigninModel signinModel);
  Future<Either<String, String>> signup(SignupModel signupModel);
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>> getUser();
}
