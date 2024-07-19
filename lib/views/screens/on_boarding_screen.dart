import 'package:e_commerce/views/screens/sign_in_screen.dart';
import 'package:e_commerce/views/widgets/launcher_screen_reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final int numPages = 3; // Number of pages in the PageView
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPageNotifier.value = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<int>(
        valueListenable: _currentPageNotifier,
        builder: (context, currentPage, child) {
          return currentPage == numPages - 1
              ? const SizedBox.shrink() // No FAB on the last page
              : FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        28.0), // Adjust the radius as needed
                  ),
                  backgroundColor: Colors.purple,
                  onPressed: () {
                    // Action to perform when the FAB is pressed
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                );
        },
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnBoardingScreenWidget(
                image: 'assets/svgs/launcher_1.svg',
                title: 'Choose Product',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              ),
              OnBoardingScreenWidget(
                image: 'assets/svgs/launcher_2.svg',
                title: 'Make Payment',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              ),
              OnBoardingScreenWidget(
                image: 'assets/svgs/launcher_3.svg',
                title: 'Get Your Order',
                description:
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: numPages,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.purple,
                  dotHeight: 12.0,
                  dotWidth: 12.0,
                ),
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, child) {
              return currentPage == numPages - 1
                  ? Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Get Started',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(); // Hide the button on other pages
            },
          ),
        ],
      ),
    );
  }
}
