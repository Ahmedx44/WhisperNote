import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/auth/signup_model.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class SignUpUsecase {
  Future<Either<String, String>> call(SignupModel signupModel) {
    return sl<AuthFirebaseService>().signup(signupModel);
  }
}
