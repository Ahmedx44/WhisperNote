import 'package:get_it/get_it.dart';
import 'package:wish_i_sent/data/source/auth/auth_service.dart';

final sl = GetIt.instance;

Future<void> initializedDependency() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
}
