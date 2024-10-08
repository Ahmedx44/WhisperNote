import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';
import 'package:wish_i_sent/domain/usecase/auth/signin_usecase.dart';
import 'package:wish_i_sent/presentation/widget/custom_app_bar.dart';
import 'package:wish_i_sent/service_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        backgroundColor: Colors.white,
        showBackButton: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.pacifico(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email TextField
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(137, 43, 42, 42)),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 133, 133, 133).withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  // Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: obsecure,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        child: Icon(
                          obsecure
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(137, 43, 42, 42)),
                      filled: true,
                      fillColor:
                          Color.fromARGB(255, 133, 133, 133).withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  // Login Button

                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      showDialog(
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()),
                      );

                      final result = await sl<SigninUsecase>().call(SigninModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));

                      result.fold(
                        (ifLeft) {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                          Future.delayed(const Duration(milliseconds: 100), () {
                            showToast(
                              ifLeft,
                              backgroundColor: Colors.red,
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: Duration(seconds: 1),
                              duration: Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          });
                        },
                        (ifRight) {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);
                          Future.delayed(const Duration(milliseconds: 100), () {
                            showToast(
                              ifRight,
                              backgroundColor: Colors.green,
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: Duration(seconds: 1),
                              duration: Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          });
                          context.push('/login');
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.cabin(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Signup Prompt

                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'or',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignInButton(
                          button: Button.Google,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignInButton(
                          button: Button.FacebookNew,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
