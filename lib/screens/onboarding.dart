// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:blog_app_flutter/pages/signin.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: accentColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: accentColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
          );
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign In',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: [
          pageStyles(
              context, onboardingTitles[0], 'assets/images/regain_focus.png'),
          pageStyles(
              context, onboardingTitles[1], 'assets/images/mobile_feed.png'),
          pageStyles(
              context, onboardingTitles[2], 'assets/images/ride_till.png'),
        ],
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return Padding(
            padding: EdgeInsets.all(45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIndicator(
                  netDragPercent: dragDistance,
                  pagesLength: pagesLength,
                  indicator: Indicator(
                    indicatorDesign: IndicatorDesign.line(
                      lineDesign: LineDesign(
                        lineType: DesignType.line_uniform,
                      ),
                    ),
                  ),
                ),
                index == pagesLength - 1
                    ? _signupButton
                    : _skipButton(setIndex: setIndex),
              ],
            ),
          );
        },
      ),
    );
  }
}

PageModel pageStyles(BuildContext context, String title, String img) {
  return PageModel(
    widget: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Center(
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Text(
                title,
                style: TextStyle(
                  fontSize: 35,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

List<String> onboardingTitles = [
  'Regain Control,',
  'Of What Internet Shows You!',
  'See What You Want To.',
];
