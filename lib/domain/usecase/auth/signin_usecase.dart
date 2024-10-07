import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class SigninUsecase {
  Future<Either<String, String>> call(SigninModel signinModel) {
    return sl<AuthFirebaseService>().signin(signinModel);
  }
}
