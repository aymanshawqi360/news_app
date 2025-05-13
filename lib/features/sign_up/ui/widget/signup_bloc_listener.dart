import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) =>
            current is SignUpLoading ||
            current is SignUpSuccess ||
            current is SignUpFailure,
        listener: (context, state) {
          if (state is SignUpLoading) {
            const CircularProgressIndicator();
          } else if (state is SignUpSuccess) {
            context.pushReplacementNamed(Routes.login);
          } else if (state is SignUpFailure) {
            _textShowDialog(context, error: state.error.toString());
          }
        },
        child: const SizedBox.shrink());
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
