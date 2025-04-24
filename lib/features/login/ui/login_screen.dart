import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/core/widget/app_text_rich.dart';
import 'package:news_app/features/login/ui/widget/social_media.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24.0.h, left: 24.0.w, right: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 167.w,
                height: 144.h,
                child: AppTextRich(
                    textOne: "Hello ",
                    styleOne: TextStyles.font48DarkGrayBold,
                    textTwo: "Again! ",
                    styleTwo: TextStyles.font48BuleBold),
              ),
              verticalSpace(4),
              SizedBox(
                width: 225.w,
                height: 60.h,
                child: Text(
                  "Welcome back you’ve\nbeen missed",
                  style: TextStyles.font20PurpleGrayRegular,
                ),
              ),
              verticalSpace(48),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextRich(
                      textOne: "Username ",
                      styleOne: TextStyles.font14PurpleGrayRegular,
                      textTwo: "*",
                      styleTwo:
                          const TextStyle(color: ColorsManager.cerisePink),
                    ),
                    verticalSpace(4),
                    AppTextFormField(
                      controller: emilController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Invalid Username";
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: const Icon(Icons.close),
                    ),
                    verticalSpace(16),
                    AppTextRich(
                      textOne: "Password ",
                      styleOne: TextStyles.font14PurpleGrayRegular,
                      textTwo: "*",
                      styleTwo:
                          const TextStyle(color: ColorsManager.cerisePink),
                    ),
                    verticalSpace(4),
                    AppTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Invalid Password";
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: const Icon(Icons.visibility_outlined),
                    ),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Checkbox(
                                tristate: true,
                                activeColor: ColorsManager.blue,
                                value: true,
                                onChanged: (vlaue) {},
                                semanticLabel: "dsdsd",
                              ),
                            ),
                            horizontalSpace(4),
                            Text("Remember me ",
                                style: TextStyles.font14PurpleGrayRegular)
                          ],
                        ),
                        Text("Forgot the password ?",
                            style: TextStyles.font14LightBlueRegular),
                      ],
                    ),
                    verticalSpace(16),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          log("message");
                          //  context.pushNamed(Routes.signUp);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: ColorsManager.blue,
                        ),
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyles.font14WhiteSemiBold,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              Center(
                child: Text(
                  'or continue with',
                  style: TextStyles.font14PurpleGrayRegular,
                ),
              ),
              verticalSpace(16),
              Row(
                children: [
                  SocialMedia(
                      name: "Facebook", image: AppAssets().iconFaceBook),
                  horizontalSpace(31),
                  SocialMedia(name: "Google", image: AppAssets().iconGoogle),
                ],
              ),
              verticalSpace(16),
              Center(
                child: AppTextRich(
                  textOne: "don’t have an account ?",
                  textTwo: " Sign Up",
                  styleOne: TextStyles.font14PurpleGrayRegular,
                  styleTwo: TextStyles.font14BlueSemiBold,
                  onTapTextTwo: () {
                    context.pushReplacementNamed(Routes.signUp);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
