import 'package:e_commerce/view_model/controllers/sign_up_controller.dart';
import 'package:e_commerce/views/widgets/reusable_button_widget.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());
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
                    "Create an",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  Text(
                    "account",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldComponent(
                    prefixIcon: Icons.person,
                    hintText: "Username or email",
                    controller: signUpController.textEditingControllerEmail.value,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldComponent(
                    prefixIcon: Icons.lock,
                    postFixIcon: Icons.visibility,
                    hintText: "Password",
                    controller: signUpController.textEditingControllerPassword.value,
                  ),
                    const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldComponent(
                    prefixIcon: Icons.lock,
                    postFixIcon: Icons.visibility,
                    hintText: "Confirm Password",
                    controller: signUpController.textEditingControllerConfirmPassword.value,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  InkWell(
                    onTap: () {},
                    child:RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "By clicking the ",
                        style: GoogleFonts.montserrat(color:const Color(0xff676767),
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
                        TextSpan(text: "Register ",
                        style: GoogleFonts.montserrat(color:const Color(0xffFF4B26),
                        fontSize: 12,
                        fontWeight: FontWeight.w300)),
                            TextSpan(text: "you agree to the public offer.",
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
                    text: "Create Account",
                    textColor: 0xffFFFFFF,
                    textSize: 20,
                    textWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Center(
                      child: Text(
                    "- OR Continue with -",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  )),
                  const SizedBox(height: 20,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: const Color(0xffFCF3F6),
                            shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(15),
                          child: FittedBox(fit: BoxFit.cover,
                          child: Image.asset("assets/images/google_logo_png.png"),),
                        ),
                        const SizedBox(width: 10,),
                         Container(
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: const Color(0xffFCF3F6),
                            shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(15),
                          child: FittedBox(fit: BoxFit.cover,
                          child: SvgPicture.asset("assets/svgs/apple_logo.svg"),),
                        ),
                        const SizedBox(width: 10,),
                         Container(
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: const Color(0xffFCF3F6),
                            shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(15),
                          child: FittedBox(fit: BoxFit.cover,
                          child: SvgPicture.asset("assets/svgs/fb_logo.svg"),),
                        ),
                       
                      ],
                    ),
                  ),
                  const SizedBox(height: 28,),
                  Center(child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "I already have an account ",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: const Color(0xff575757))),
                      const  TextSpan(text: "Login",
                        style: TextStyle(color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                        )
                      ]
                    )),
                  ),)
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }
}
