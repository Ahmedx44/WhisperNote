import 'package:WhisperNote/core/theme/apptheme.dart';
import 'package:WhisperNote/firebase_options.dart';
import 'package:WhisperNote/presentation/pages/auth/pages/auth_gate.dart';
import 'package:WhisperNote/presentation/pages/auth/pages/login.dart';
import 'package:WhisperNote/presentation/pages/auth/pages/signinorsignup.dart';
import 'package:WhisperNote/presentation/pages/auth/pages/signup.dart';
import 'package:WhisperNote/presentation/pages/home/pages/home.dart';
import 'package:WhisperNote/presentation/pages/onboarding_screen/onboarding_screen.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: '/',
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
      theme: theme,
      routerConfig: _goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
