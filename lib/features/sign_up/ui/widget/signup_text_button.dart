import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_state.dart';

class SignUpTextButton extends StatelessWidget {
  final void Function()? onTap;
  const SignUpTextButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                child: state is SignUpLoading
                    ? SizedBox(
                        width: 23.w,
                        height: 23.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 4,
                          color: ColorsManager.primarywhiteColor,
                        ),
                      )
                    : Text(
                        "SignUp",
                        style: TextStyles.font14WhiteSemiBold,
                      )),
          ),
        );
      },
    );
  }
}
