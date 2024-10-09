import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wish_i_sent/firebase_options.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/auth_gate.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/login.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/signinorsignup.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/signup.dart';
import 'package:wish_i_sent/presentation/pages/home/home.dart';
import 'package:wish_i_sent/presentation/pages/onboarding_screen/onboarding_screen.dart';
import 'package:wish_i_sent/presentation/pages/splash_Screen/splash_screen.dart';
import 'package:wish_i_sent/service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializedDependency();

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final GoRouter _goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/authGate',
      builder: (context, state) => const AuthGate(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreenn(),
    ),
    GoRoute(
      path: '/signinorsingup',
      builder: (context, state) => const Signinorsignup(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
