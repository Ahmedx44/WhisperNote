import 'package:get_it/get_it.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/domain/usecase/auth/signin_usecase.dart';
import 'package:wish_i_sent/domain/usecase/auth/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initializedDependency() async {
  //Service
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  //Usecases
  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase());
}
