import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/service_provider.dart';

class SigninWithGoogleUseCase {
  Future<Either<String, String>> call() {
    return sl<AuthFirebaseService>().signinWithGoogle();
  }
}
