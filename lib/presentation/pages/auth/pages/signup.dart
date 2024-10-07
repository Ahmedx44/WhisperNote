import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/presentation/pages/auth/widget/custom_app_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obsecure = true;

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
                            : CupertinoIcons.eye_slash_fill,
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

                Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
