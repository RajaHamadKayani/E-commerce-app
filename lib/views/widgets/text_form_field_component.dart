import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldComponent extends StatefulWidget {
  var prefixIcon;
  var hintText;
  var postFixIcon;
  var controller;
  var bgColor;
  TextFormFieldComponent(
      {super.key,
      this.controller,
      this.hintText,
      this.bgColor,
      this.prefixIcon,
      this.postFixIcon});

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:widget.bgColor==null ?const  Color(0xffA8A8A9):Color(widget.bgColor!)),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 17, left: 15,right: 15),
        child: TextFormField(
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: const Color(0xffCCCCCC),
              fontSize: 12),
          controller: widget.controller,
          decoration: InputDecoration(
            border:InputBorder.none,
            suffix: Icon(widget.postFixIcon,
            color:const Color(0xff676767),),
            prefixIcon: Icon(widget.prefixIcon,
            color:const  Color(0xff676767),),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff676767),
                  fontSize: 12)),
        ),
      ),
    );
  }
}
