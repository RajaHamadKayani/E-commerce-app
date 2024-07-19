import 'package:e_commerce/views/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedToPaymentDialogBox extends StatefulWidget {
  final String title;
  const ProceedToPaymentDialogBox({super.key,required this.title});

  @override
  State<ProceedToPaymentDialogBox> createState() => _ProceedToPaymentDialogBoxState();
}

class _ProceedToPaymentDialogBoxState extends State<ProceedToPaymentDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/done.png"),
                Image.asset("assets/images/tick.png")
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
             widget.title,
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: const Color(0xffF83758),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "OK",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

