import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

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
            child: Text(
          "Login",
          style: TextStyles.font14WhiteSemiBold,
        )),
      ),
    );
  }
}
