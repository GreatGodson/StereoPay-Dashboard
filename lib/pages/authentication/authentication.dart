import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streopay_dashboard/constants/style.dart';
import 'package:streopay_dashboard/routing/routes.dart';
import 'package:streopay_dashboard/widgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Container(
          height: 582,
          width: 380,
          color: AppColors.whiteColor,
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset('assets/icons/logo.svg')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Danny Dribble",
                    style: GoogleFonts.mulish(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                        color: AppColors.brightTextColor),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Log In to Danny D",
                      style: GoogleFonts.mulish(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkTextColor)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter your email and password below",
                      style: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightTextColor)),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text("EMAIL",
                        style: GoogleFonts.mulish(
                            fontSize: 12,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w700,
                            color: AppColors.lightTextColor)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Email address",
                        hintText: "abc@domain.com",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("PASSWORD",
                            style: GoogleFonts.mulish(
                                fontSize: 12,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightTextColor)),
                        Text("Forgot Password?",
                            style: GoogleFonts.mulish(
                                fontSize: 12,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightTextColor)),
                      ],
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "123",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: "Log in",
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't not have an account? ",
                    style: GoogleFonts.mulish(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightTextColor)),
                const TextSpan(
                    text: "Sign Up ",
                    style: TextStyle(color: AppColors.buttonColor))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
