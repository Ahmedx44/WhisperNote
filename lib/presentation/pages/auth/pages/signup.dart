import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastify_flutter/toastify_flutter.dart';
import 'package:wish_i_sent/data/model/auth/signup_model.dart';
import 'package:wish_i_sent/domain/usecase/auth/signup_usecase.dart';
import 'package:wish_i_sent/presentation/pages/auth/widget/custom_app_bar.dart';
import 'package:wish_i_sent/service_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obsecure = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        backgroundColor: Colors.white,
        showBackButton: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.pacifico(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                //Username TextField
                TextField(
                  controller: _usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(137, 43, 42, 42)),
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
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // Email TextField
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(137, 43, 42, 42)),
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
                  style: const TextStyle(color: Colors.white),
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
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(137, 43, 42, 42)),
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
                  style:
                      const TextStyle(color: Color.fromARGB(137, 43, 42, 42)),
                ),
                const SizedBox(height: 20),
                // Login Button

                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                    );

                    final result = await sl<SignUpUsecase>().call(SignupModel(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                    ));

                    result.fold(
                      (ifLeft) {
                        Navigator.pop(context);
                        ToastifyFlutter.error(
                          context,
                          message: ifLeft.toString(),
                          duration: 5,
                          position: ToastPosition.bottom,
                          style: ToastStyle.simple,
                          onClose: true,
                        );
                      },
                      (ifRight) {
                        Navigator.pop(context);
                        ToastifyFlutter.success(
                          context,
                          message: ifRight.toString(),
                          duration: 5,
                          position: ToastPosition.bottom,
                          style: ToastStyle.simple,
                          onClose: true,
                        );
                        context.go('/login');
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
                          'Signup',
                          style: GoogleFonts.cabin(
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
                      'ALready have Account? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/loginn');
                      },
                      child: const Text(
                        'Sign In',
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
    );
  }
}
