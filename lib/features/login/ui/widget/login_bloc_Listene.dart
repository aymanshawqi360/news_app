import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class LoginBlocListene extends StatelessWidget {
  const LoginBlocListene({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {}

        if (state is LoginSuccess) {
          context.pushNamedAndRemoveUntil(Routes.home, predicate: (v) => false);
        }
        if (state is LoginFailure) {
          _textShowDialog(context, error: state.error.error.toString());
        }
      },
      child: Container(),
    );
  }

  _textShowDialog(BuildContext context, {required String error}) {
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
          error,
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
