
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableButtonWidget extends StatefulWidget {
  int? bgColor;
  String? text;
  double? borderRadius;
  int? textColor;
  double? textSize;
  FontWeight? textWeight;
  ReusableButtonWidget(
      {super.key,
      this.bgColor,
      this.borderRadius,
      this.text,
      this.textColor,
      this.textSize,
      this.textWeight});

  @override
  State<ReusableButtonWidget> createState() => _ReusableButtonWidgetState();
}

class _ReusableButtonWidgetState extends State<ReusableButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(widget.bgColor!),
          borderRadius: BorderRadius.circular(widget.borderRadius!)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 15),
          child: Text(
            widget.text ?? "",
            style: GoogleFonts.montserrat(
                color: Color(widget.textColor!),
                fontSize: widget.textSize!,
                fontWeight: widget.textWeight!),
          ),
        ),
      ),
    );
  }
}
