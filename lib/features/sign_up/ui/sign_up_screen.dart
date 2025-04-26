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
import 'package:news_app/features/login/ui/widget/social_media.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/sign_up/ui/widget/email_and_password.dart';
import 'package:news_app/features/sign_up/ui/widget/signup_bloc_listener.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24.0.h, left: 24.0.w, right: 24.0.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: TextStyles.font48BlueGrayBold,
                ),
                verticalSpace(4),
                Text(
                  "Signup to get Started",
                  style: TextStyles.font20PurpleGrayRegular,
                ),
                verticalSpace(65),
                const EmailAndPassword(),
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
                      textOne: "Already have an account ?",
                      textTwo: " Logins",
                      styleOne: TextStyles.font14PurpleGrayRegular,
                      styleTwo: TextStyles.font14BlueSemiBold,
                      onTapTextTwo: () {
                        context.pushReplacementNamed(Routes.login);
                      }),
                ),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
