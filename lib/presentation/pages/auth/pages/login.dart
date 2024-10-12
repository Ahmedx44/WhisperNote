import 'package:WhisperNote/core/asset/app_image.dart';
import 'package:WhisperNote/data/model/auth/signin_model.dart';
import 'package:WhisperNote/domain/usecase/auth/signin_usecase.dart';
import 'package:WhisperNote/domain/usecase/auth/signin_with_google.dart';
import 'package:WhisperNote/presentation/widget/custom_app_bar.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const MyAppBar(
        backgroundColor: Colors.white,
        showBackButton: true,
      ),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email TextField
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: GoogleFonts.caveat(color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 133, 133, 133)
                          .withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    style: GoogleFonts.caveat(color: Colors.white),
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
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 133, 133, 133)
                          .withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    style: GoogleFonts.caveat(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  // Login Button

                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
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
                              animation: StyledToastAnimation.slideFromTop,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          });
                        },
                        (ifRight) {
                          FocusScope.of(context).unfocus();
                          context.go('/home');
                          Navigator.pop(context);
                          Future.delayed(const Duration(milliseconds: 100), () {
                            showToast(
                              ifRight,
                              backgroundColor: Colors.green,
                              context: context,
                              animation: StyledToastAnimation.slideFromTop,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
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
                            style: GoogleFonts.caveat(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
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

                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'or',
                          style:
                              GoogleFonts.caveat(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Expanded(child: Divider())
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              );

                              final result =
                                  await sl<SigninWithGoogleUseCase>().call();
                              result.fold((ifLeft) {
                                print('ahmedddddddddddddddddd');
                                print(ifLeft);
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  showToast(
                                    ifLeft,
                                    backgroundColor: Colors.red,
                                    context: context,
                                    animation:
                                        StyledToastAnimation.slideFromTop,
                                    reverseAnimation: StyledToastAnimation.fade,
                                    position: StyledToastPosition.top,
                                    animDuration: const Duration(seconds: 1),
                                    duration: const Duration(seconds: 4),
                                    curve: Curves.elasticOut,
                                    reverseCurve: Curves.linear,
                                  );
                                });
                              }, (ifRight) {
                                context.go('/home');
                              });
                            },
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(height: 30, AppImage.google),
                                  Text(
                                    'Signin with google',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: GoogleFonts.caveat(
                            color: Colors.white, fontSize: 22),
                      ),
                      GestureDetector(
                        onTap: () async {
                          context.go('/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.caveat(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 22,
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
