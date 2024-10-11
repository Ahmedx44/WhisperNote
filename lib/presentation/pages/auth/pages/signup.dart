import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/data/model/auth/signup_model.dart';
import 'package:wish_i_sent/domain/usecase/auth/signin_with_google.dart';
import 'package:wish_i_sent/domain/usecase/auth/signup_usecase.dart';
import 'package:wish_i_sent/presentation/widget/custom_app_bar.dart';
import 'package:wish_i_sent/service_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obsecure = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  showDialogg(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        showBackButton: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.pacifico(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                //Username TextField
                TextField(
                  controller: _usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: GoogleFonts.caveat(
                      color: Colors.white,
                    ),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // Email TextField
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.caveat(
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  style: GoogleFonts.caveat(color: Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                    hintStyle: GoogleFonts.caveat(
                      color: Colors.white,
                    ),
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

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextField(
                  controller: _confirmPasswordController,
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
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.caveat(
                      color: Colors.white,
                    ),
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

                InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );

                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      Navigator.pop(context);
                      showToast(
                        'Passwords don\'t match',
                        backgroundColor: Colors.red,
                        context: context,
                        animation: StyledToastAnimation.slideFromTop,
                        reverseAnimation: StyledToastAnimation.slideFromTop,
                        position: StyledToastPosition.top,
                        animDuration: const Duration(seconds: 2),
                        duration: const Duration(seconds: 4),
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.linear,
                      );
                      return;
                    }

                    final result = await sl<SignUpUsecase>().call(SignupModel(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                    ));

                    result.fold(
                      (ifLeft) {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                        showToast(
                          ifLeft,
                          context: context,
                          animation: StyledToastAnimation.slideFromTop,
                          reverseAnimation: StyledToastAnimation.fade,
                          position: StyledToastPosition.top,
                          animDuration: const Duration(seconds: 1),
                          duration: const Duration(seconds: 4),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.linear,
                        );
                      },
                      (ifRight) {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                        showToast(
                          ifRight,
                          context: context,
                          animation: StyledToastAnimation.slideFromTop,
                          reverseAnimation: StyledToastAnimation.fade,
                          position: StyledToastPosition.top,
                          animDuration: const Duration(seconds: 1),
                          duration: const Duration(seconds: 4),
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.linear,
                        );
                        context.push('/login');
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
                          'Signup',
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
                        style: GoogleFonts.caveat(fontWeight: FontWeight.bold),
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
                      child: SignInButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                                child: CircularProgressIndicator()),
                          );

                          final result =
                              await sl<SigninWithGoogleUseCase>().call();
                          result.fold((ifLeft) {
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
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
                          }, (ifRight) {
                            context.go('/home');
                          });
                        },
                        button: Button.Google,
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
                    Text(
                      'Already have Account? ',
                      style: GoogleFonts.caveat(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacement('/login');
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.caveat(
                          color: Theme.of(context).colorScheme.primary,
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
    );
  }
}
