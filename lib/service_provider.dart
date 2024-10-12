import 'package:WhisperNote/data/source/auth/auth_service.dart';
import 'package:WhisperNote/data/source/post/post_service.dart';
import 'package:WhisperNote/domain/usecase/auth/get_user.dart';
import 'package:WhisperNote/domain/usecase/auth/signin_usecase.dart';
import 'package:WhisperNote/domain/usecase/auth/signin_with_google.dart';
import 'package:WhisperNote/domain/usecase/auth/signup_usecase.dart';
import 'package:WhisperNote/domain/usecase/post/get_post_usecase.dart';
import 'package:WhisperNote/domain/usecase/post/post_usecase.dart';
import 'package:get_it/get_it.dart';

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
