import 'package:get_it/get_it.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';
import 'package:wish_i_sent/data/source/post/post_service.dart';
import 'package:wish_i_sent/domain/usecase/auth/get_user.dart';
import 'package:wish_i_sent/domain/usecase/auth/signin_usecase.dart';
import 'package:wish_i_sent/domain/usecase/auth/signin_with_google.dart';
import 'package:wish_i_sent/domain/usecase/auth/signup_usecase.dart';
import 'package:wish_i_sent/domain/usecase/post/get_post_usecase.dart';
import 'package:wish_i_sent/domain/usecase/post/post_usecase.dart';

final sl = GetIt.instance;

Future<void> initializedDependency() async {
  //Service
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  sl.registerSingleton<PostService>(
    PostServiceImpl(),
  );

  //Usecases
  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
  sl.registerSingleton<SignUpUsecase>(
    SignUpUsecase(),
  );
  sl.registerSingleton<PostUsecase>(
    PostUsecase(),
  );
  sl.registerSingleton<GetPostUsecase>(
    GetPostUsecase(),
  );
  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(),
  );
  sl.registerSingleton<SigninWithGoogleUseCase>(
    SigninWithGoogleUseCase(),
  );
}
