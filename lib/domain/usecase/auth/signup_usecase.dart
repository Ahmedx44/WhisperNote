import 'package:WhisperNote/data/model/auth/signup_model.dart';
import 'package:WhisperNote/data/source/auth/auth_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:dartz/dartz.dart';

class SignUpUsecase {
  Future<Either<String, String>> call(SignupModel signupModel) {
    return sl<AuthFirebaseService>().signup(signupModel);
  }
}
