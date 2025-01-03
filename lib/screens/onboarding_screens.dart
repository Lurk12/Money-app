import 'package:flutter/material.dart';
import 'package:money_application/widget/widget_onboardingscreen_1.dart';
import 'package:money_application/widget/widget_onboardingscreen_2.dart';
import 'package:money_application/widget/widget_onboardingscreen_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboaringScreen extends StatefulWidget {
  const OnboaringScreen({super.key});

  @override
  State<OnboaringScreen> createState() => _OnboaringScreenState();
}

class _OnboaringScreenState extends State<OnboaringScreen> {
  // variable controller
  late PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
  children: [
    PageView(
      controller: _controller,
      children:  [
        OnboaringScreen1(controller: _controller),
        Onboardingscreen2(controller: _controller,),
       const Onboardingscreen3()
      ],
    ),
    Positioned(
      bottom: 70,
      left: 30, // Adjust this to your desired location
      child: SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect: const WormEffect(
          activeDotColor: Colors.blue,
          dotHeight: 10,
          dotWidth: 10,
        ),
           onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
      ),
    ),
  ],
),
      ),
    );
  }
}
