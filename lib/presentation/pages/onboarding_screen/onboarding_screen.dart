import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:wish_i_sent/core/asset/app_vector.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: OnBoardingScreen(
          onSkip: () {
            debugPrint("On Skip Called....");
          },
          showPrevNextButton: true,
          showIndicator: true,
          backgourndColor: Colors.white,
          activeDotColor: Colors.blue,
          deactiveDotColor: Colors.grey,
          iconColor: Colors.black,
          leftIcon: Icons.arrow_circle_left_rounded,
          rightIcon: Icons.arrow_circle_right_rounded,
          iconSize: 30,
          pages: [
            OnBoardingModel(
              image: SvgPicture.asset(AppVector.write),
              title: "Write & Share, Anonymously",
              body:
                  "Sometimes, the words we can't say out loud are the ones that matter most. Share your deepest thoughts and feelings anonymously with those who mean the world to you",
            ),
            OnBoardingModel(
              image: SvgPicture.asset(AppVector.write),
              title: "Discover Unspoken Words",
              body:
                  "Search for messages left for those you care about, or explore heartfelt words in categories like Friend, Family, or Lover. You might just find a message meant for you.",
            ),
          ],
        ));
  }
}
