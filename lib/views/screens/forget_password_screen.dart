import 'package:e_commerce/view_model/controllers/forget_password_controller.dart';
import 'package:e_commerce/view_model/controllers/sign_up_controller.dart';
import 'package:e_commerce/views/widgets/reusable_button_widget.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 32, right: 32,bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  Text(
                    "password?",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldComponent(
                    prefixIcon: Icons.email,
                    hintText: "Enter your Email",
                    controller: forgetPasswordController.textEditingControllerEmail.value,
                  ),
                 
                  const SizedBox(
                    height: 9,
                  ),
                  InkWell(
                    onTap: () {},
                    child:RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "* ",
                        style: GoogleFonts.montserrat(color:const Color(0xffFF4B26),
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
                        TextSpan(text: "We will send you a message to set or reset your new password",
                        style: GoogleFonts.montserrat(color:const Color(0xff676767),
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
                        
                      ]
                    ),),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  ReusableButtonWidget(
                    bgColor: 0xffF83758,
                    borderRadius: 4,
                    text: "Submit",
                    textColor: 0xffFFFFFF,
                    textSize: 20,
                    textWeight: FontWeight.w600,
                  ),
                 
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }
}
