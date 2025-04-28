import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/core/widget/app_text_rich.dart';
import 'package:news_app/features/login/logic/cubit/login_cubit.dart';

class LoginEmailAndPassword extends StatefulWidget {
  const LoginEmailAndPassword({
    super.key,
  });

  @override
  State<LoginEmailAndPassword> createState() => _LoginEmailAndPasswordState();
}

class _LoginEmailAndPasswordState extends State<LoginEmailAndPassword> {
  bool isEmail = false;
  bool isobscure = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
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
            controller: context.read<LoginCubit>().emilController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Email";
              } else {
                return null;
              }
            },
            suffixIcon: GestureDetector(
                onTap: () {
                  if (context
                      .read<LoginCubit>()
                      .emilController
                      .text
                      .isNotEmpty) {
                    context.read<LoginCubit>().emilController.text = "";
                    isEmail = !isEmail;
                  }
                  setState(() {});
                },
                child: Visibility(
                    visible: isEmail, child: const Icon(Icons.close))),
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
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return "Invalid Password";
              } else {
                return null;
              }
            },
            obscure: isobscure,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                child: Icon(isobscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined)),
          ),
        ],
      ),
    );
  }
}
