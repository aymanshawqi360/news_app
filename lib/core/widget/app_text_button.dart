import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';
import 'package:news_app/features/login/logic/cubit/login_state.dart';

class AppTextButton extends StatelessWidget {
  final void Function()? onTap;
  const AppTextButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
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
            child:
                // ? SizedBox(
                //     width: 25.w,
                //     height: 25.h,
                //     child: const CircularProgressIndicator(
                //       strokeWidth: 5,
                //       color: ColorsManager.primarywhiteColor,
                //     ),
                //   )
                Text(
          "Login",
          style: TextStyles.font14WhiteSemiBold,
        )),
      ),
    );
  }
}
