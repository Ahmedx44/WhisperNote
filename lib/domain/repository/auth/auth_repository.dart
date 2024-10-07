import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';

abstract class AuthRepository {
  Future<Either<String, String>> signin(SigninModel signinModel);
  Future<Either<String, String>> signup();
}
