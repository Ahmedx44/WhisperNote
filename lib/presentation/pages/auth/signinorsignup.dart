import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/core/asset/app_vector.dart';

class Signinorsignup extends StatefulWidget {
  const Signinorsignup({super.key});

  @override
  State<Signinorsignup> createState() => _SigninorsignupState();
}

class _SigninorsignupState extends State<Signinorsignup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define the animation to bounce the content from top to bottom
    _animation = Tween<double>(begin: 300, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Use a Stack to allow content positioning
        child: Stack(
          children: [
            // Animated content
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  // Animate the vertical position (bounce effect)
                  offset: Offset(_animation.value, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          height: 300,
                          AppVector.free,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'UnSpoken',
                        style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Ready to share what’s on your heart? Sign in to reconnect with the messages that matter most.',
                          style: GoogleFonts.caveat(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            width: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 149, 221, 255),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.cabin(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            width: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 204, 250, 205),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.cabin(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
