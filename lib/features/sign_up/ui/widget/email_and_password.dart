import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/core/widget/app_text_rich.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextRich(
            textOne: "Email ",
            styleOne: TextStyles.font14PurpleGrayRegular,
            textTwo: "*",
            styleTwo: const TextStyle(color: ColorsManager.cerisePink),
          ),
          verticalSpace(4),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emilController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Email";
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(Icons.close),
          ),
          verticalSpace(16),
          AppTextRich(
            textOne: "Password ",
            styleOne: TextStyles.font14PurpleGrayRegular,
            textTwo: "*",
            styleTwo: const TextStyle(color: ColorsManager.cerisePink),
          ),
          verticalSpace(4),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Password";
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(Icons.visibility_outlined),
          ),
          verticalSpace(10),
          Row(
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
                  Text("Remember me ",
                      style: TextStyles.font14PurpleGrayRegular)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
