import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';

class ForgotThepassword extends StatelessWidget {
  const ForgotThepassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccessForgotThepassword ||
          current is LoginSSSSSS ||
          current is LoginFailureForgotThepassword ||
          current is LoginLoadingForgotThepassword,
      listener: (context, state) {
        if (state is LoginLoadingForgotThepassword) {}
        if (state is LoginSuccessForgotThepassword) {
          _textShowDialog(context, state.successforgotThepassword.toString());
        }
        if (state is LoginSSSSSS) {
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
                Text("Remember me ", style: TextStyles.font14PurpleGrayRegular)
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<LoginCubit>().forgotThepassword();
              },
              child: Text("Forgot the password ?",
                  style: TextStyles.font14LightBlueRegular),
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
            child: const Text("حسناً"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
