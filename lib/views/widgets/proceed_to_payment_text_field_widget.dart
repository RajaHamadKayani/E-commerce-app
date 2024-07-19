import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedToPaymentTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String imagePath;

  ProceedToPaymentTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.imagePath,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProceedToPaymentTextFieldWidget> createState() =>
      _ProceedToPaymentTextFieldWidgetState();
}

class _ProceedToPaymentTextFieldWidgetState
    extends State<ProceedToPaymentTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF4F4F4),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              width: 47, // Adjust the width as necessary
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain, // Use BoxFit.contain to maintain aspect ratio
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                style: GoogleFonts.montserrat(
                  color: Color(0xff6E7179),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.montserrat(
                    color: Color(0xff6E7179),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
