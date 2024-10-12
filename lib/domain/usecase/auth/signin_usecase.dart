import 'package:WhisperNote/data/model/auth/signin_model.dart';
import 'package:WhisperNote/data/source/auth/auth_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:dartz/dartz.dart';

class SigninUsecase {
  Future<Either<String, String>> call(SigninModel signinModel) {
    return sl<AuthFirebaseService>().signin(signinModel);
  }
}
