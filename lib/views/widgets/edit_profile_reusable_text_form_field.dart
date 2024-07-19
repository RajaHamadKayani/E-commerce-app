import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileReusableTextFormField extends StatefulWidget {
  var controller;
  var hintText;
  EditProfileReusableTextFormField({super.key, this.controller, this.hintText});

  @override
  State<EditProfileReusableTextFormField> createState() =>
      _EditProfileReusableTextFormFieldState();
}

class _EditProfileReusableTextFormFieldState
    extends State<EditProfileReusableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffC8C8C8), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              )),
        ),
      ),
    );
  }
}
