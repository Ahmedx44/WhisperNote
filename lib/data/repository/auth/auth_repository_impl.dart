import 'package:dartz/dartz.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/domain/repository/auth/auth_repository.dart';
import 'package:wish_i_sent/service_provider.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<String, String>> signin(SigninModel signinModel) async {
    return await sl<AuthFirebaseService>().signin(signinModel);
  }

  @override
  Future<Either<String, String>> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
