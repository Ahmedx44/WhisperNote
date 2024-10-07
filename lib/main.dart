import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/login.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/signinorsignup.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/signup.dart';
import 'package:wish_i_sent/presentation/pages/onboarding_screen/onboarding_screen.dart';
import 'package:wish_i_sent/presentation/pages/splash_Screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
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
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
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
