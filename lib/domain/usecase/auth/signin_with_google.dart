import 'package:WhisperNote/data/source/auth/auth_service.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:dartz/dartz.dart';

class SigninWithGoogleUseCase {
  Future<Either<String, String>> call() {
    return sl<AuthFirebaseService>().signinWithGoogle();
  }
}
