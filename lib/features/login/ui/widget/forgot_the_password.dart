import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';
import 'package:news_app/generated/locale_keys.g.dart';
import 'package:news_app/news_app.dart';

class ForgotThepassword extends StatelessWidget {
  const ForgotThepassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccessForgotThepassword ||
          current is LoginForgotthepassword ||
          current is LoginFailureForgotThepassword ||
          current is LoginLoadingForgotThepassword,
      listener: (context, state) {
        if (state is LoginLoadingForgotThepassword) {}
        if (state is LoginSuccessForgotThepassword) {
          _textShowDialog(context, state.successforgotThepassword.toString());
        }
        if (state is LoginForgotthepassword) {
          _textShowDialog(context, state.error.toString());
        }
        if (state is LoginFailureForgotThepassword) {
          _textShowDialog(
              context, state.failureforgotThepassword.error.toString());
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.h, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 18,
                    height: MediaQuery.of(context).size.height / 28,
                    child: Checkbox(
                      tristate: true,
                      activeColor: ColorsManager.blue,
                      value: true,
                      onChanged: (vlaue) {},
                      semanticLabel: "dsdsd",
                    ),
                  ),
                  horizontalSpace(4),
                  Text(
                    LocaleKeys.Login_RememberMe.tr(),
                    style: TextStyles.font12PurpleGrayRegular,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<LoginCubit>().forgotThepassword();
              },
              child: Text(LocaleKeys.Login_ForgotThePassword.tr(),
                  style: TextStyles.font12LightBlueRegular),
            ),
          ],
        );
      },
    );
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
            child: Text(LocaleKeys.Login_Good.tr()),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
