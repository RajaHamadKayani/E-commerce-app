import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableListViewBuilder extends StatefulWidget {
  const ReusableListViewBuilder({super.key});

  @override
  State<ReusableListViewBuilder> createState() =>
      _ReusableListViewBuilderState();
}

class _ReusableListViewBuilderState extends State<ReusableListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Constants.catgoriesNames.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                    width: 55,
                    child: Image.asset(
                      Constants.categoriesImages[index],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Constants.catgoriesNames[index],
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff21003D),
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
