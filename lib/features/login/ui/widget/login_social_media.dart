import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/widget/app_social_media.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';

class LoginSocialMedia extends StatelessWidget {
  const LoginSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccessSignInWithGoogle ||
          current is LoginFailureSignInWithGoogle ||
          current is LoginLoadingSignInWithGoogle,
      listener: (context, state) {
        if (state is LoginLoadingSignInWithGoogle) {}
        if (state is LoginFailureSignInWithGoogle) {
          _textShowDialog(context, state.error!.error.toString());
        }
        if (state is LoginSuccessSignInWithGoogle) {
          context.pushNamedAndRemoveUntil(Routes.home, predicate: (v) => false);
        }
      },
      child: Row(
        children: [
          AppSocialMedia(name: "Facebook", image: AppAssets().iconFaceBook),
          horizontalSpace(31),
          GestureDetector(
              onTap: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
              child: AppSocialMedia(
                  name: "Google", image: AppAssets().iconGoogle)),
        ],
      ),
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
