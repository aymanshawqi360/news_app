import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_text_button.dart';
import 'package:news_app/core/widget/app_text_rich.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/ui/widget/forgot_the_password.dart';
import 'package:news_app/features/login/ui/widget/login_bloc_Listene.dart';
import 'package:news_app/features/login/ui/widget/login_email_and_password.dart';
import 'package:news_app/features/login/ui/widget/social_media.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const LoginEmailAndPassword(),
              verticalSpace(10),
              const ForgotThepassword(),
              verticalSpace(16),
              AppTextButton(
                onTap: () {
                  validateThenDoLogin(context);
                },
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
              ),
              const LoginBlocListene()
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
