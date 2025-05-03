import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class LoginTextButton extends StatelessWidget {
  final Function()? onTap;
  const LoginTextButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: ColorsManager.blue,
            ),
            child: Center(
                child: state is LoginLoading
                    ? SizedBox(
                        width: 23.w,
                        height: 23.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 4,
                          color: ColorsManager.primarywhiteColor,
                        ),
                      )
                    : Text(
                        LocaleKeys.Login_Login.tr(),
                        style: TextStyles.font14WhiteSemiBold,
                      )),
          ),
        );
      },
    );
  }
}
