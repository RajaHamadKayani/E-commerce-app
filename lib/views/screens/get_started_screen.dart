import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              "assets/svgs/get_started.svg",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
