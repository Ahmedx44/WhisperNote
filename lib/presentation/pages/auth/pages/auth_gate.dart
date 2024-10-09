import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wish_i_sent/presentation/pages/auth/pages/signinorsignup.dart';
import 'package:wish_i_sent/presentation/pages/home/home.dart';
import 'package:wish_i_sent/presentation/pages/onboarding_screen/onboarding_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late SharedPreferences prefs;
  bool firstOpen = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first-open') == null) {
      setState(() {
        firstOpen = true;
      });
    } else {
      setState(() {
        firstOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (firstOpen) {
          return const OnboardingScreenn();
        } else {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Signinorsignup();
          }
        }
      },
    );
  }
}
