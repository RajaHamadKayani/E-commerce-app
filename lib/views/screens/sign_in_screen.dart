import 'package:e_commerce/views/screens/dashboard.dart';
import 'package:e_commerce/views/screens/forget_password_screen.dart';
import 'package:e_commerce/views/screens/get_started_screen.dart';
import 'package:e_commerce/views/screens/sign_up_screen.dart';
import 'package:e_commerce/view_model/controllers/login_controller.dart';
import 'package:e_commerce/views/widgets/reusable_button_widget.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginController loginController = Get.put(LoginController());
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
                    "Welcome",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  Text(
                    "Back!",
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
                    controller: loginController.textEditingControllerEmail.value,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldComponent(
                    prefixIcon: Icons.lock,
                    postFixIcon: Icons.visibility,
                    hintText: "Password",
                    controller: loginController.textEditingControllerPassword.value,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                      },
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
                    },
                    child: ReusableButtonWidget(
                      bgColor: 0xffF83758,
                      borderRadius: 4,
                      text: "Login",
                      textColor: 0xffFFFFFF,
                      textSize: 20,
                      textWeight: FontWeight.w600,
                    ),
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
                  Center(child:GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                    },
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "Create An Account ",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: const Color(0xff575757))),
                      const  TextSpan(text: "SignUp",
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
