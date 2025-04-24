// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/core/theming/colors.dart';

class AppTextFormField extends StatelessWidget {
  final BorderRadius? radius;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Function(String?) validator;
  final bool? obscure;

  const AppTextFormField({
    super.key,
    this.radius,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscure ?? false,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.primarywhiteColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        suffixIcon: suffixIcon ?? const Icon(Icons.visibility_outlined),
        border: OutlineInputBorder(
          borderRadius: radius ?? BorderRadius.circular(6.r),
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.purpleGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.purpleGray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.cerisePink),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.cerisePink),
        ),
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
