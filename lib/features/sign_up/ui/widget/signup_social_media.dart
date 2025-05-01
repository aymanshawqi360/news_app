import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/widget/app_social_media.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_state.dart';

class SignupSocialMedia extends StatelessWidget {
  const SignupSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpWithGoogleFailure ||
          current is SignUpWithGoogleLoading ||
          current is SignUpWithGoogleSuccess ||
          current is SignUpLoadingWithFacebook ||
          current is SignUpFailureWithFacebook ||
          current is SignUpSuccessWithFacebook,
      listener: (context, state) {
        if (state is SignUpWithGoogleLoading) {
        } else if (state is SignUpWithGoogleFailure) {
          _textShowDialog(context, state.error!.error.toString());
        } else if (state is SignUpWithGoogleSuccess) {
          // _textShowDialog(context, state.successFull.toString());
          context.pushNamedAndRemoveUntil(Routes.home, predicate: (v) => false);
        } else if (state is SignUpLoadingWithFacebook) {
        } else if (state is SignUpFailureWithFacebook) {
          _textShowDialog(context, state.error!.error.toString());
        } else if (state is SignUpSuccessWithFacebook) {
          context.pushNamedAndRemoveUntil(Routes.home, predicate: (v) => false);
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
                onTap: () {
                  context.read<SignUpCubit>().signUpWithFacebook();
                },
                child: AppSocialMedia(
                    name: "Facebook", image: AppAssets().iconFaceBook)),
            horizontalSpace(31),
            GestureDetector(
                onTap: () {
                  context.read<SignUpCubit>().signInWithGoogle();
                },
                child: AppSocialMedia(
                    name: "Google", image: AppAssets().iconGoogle)),
          ],
        );
      },
    );
  }
}

_textShowDialog(BuildContext context, String state) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // title: const Text("تم إرسال البريد"),
      title: const Icon(
        Icons.error,
        color: ColorsManager.cerisePink,
      ),
      // Text("تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب."),
      content: Text(
        textAlign: TextAlign.center,
        state.toString(),
        style: TextStyle(fontSize: 20.sp),
      ),
      actions: [
        TextButton(
          child: const Text("حسناً"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
