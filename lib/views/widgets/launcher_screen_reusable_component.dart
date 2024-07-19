import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreenWidget extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  OnBoardingScreenWidget({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<OnBoardingScreenWidget> createState() => _OnBoardingScreenWidgetState();
}

class _OnBoardingScreenWidgetState extends State<OnBoardingScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              widget.image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          // Ensure you have the images in your assets
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color:const  Color(0xffA8A8A9)
            ),
          ),
        ],
      ),
    );
  }
}
