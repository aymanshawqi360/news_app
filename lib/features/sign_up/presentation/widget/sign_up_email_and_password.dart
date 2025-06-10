import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/core/widget/app_text_rich.dart';
import 'package:news_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class SignUpEmailAndPassword extends StatefulWidget {
  const SignUpEmailAndPassword({
    super.key,
  });

  @override
  State<SignUpEmailAndPassword> createState() => _SignUpEmailAndPasswordState();
}

class _SignUpEmailAndPasswordState extends State<SignUpEmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextRich(
            textOne: LocaleKeys.Login_Email.tr(),
            styleOne: TextStyles.font14PurpleGrayRegular,
            textTwo: "*",
            styleTwo: const TextStyle(color: ColorsManager.cerisePink),
          ),
          verticalSpace(4),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emilController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return LocaleKeys.Login_InvalidEmail.tr();
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(Icons.close),
          ),
          verticalSpace(16),
          AppTextRich(
            textOne: LocaleKeys.Login_Password.tr(),
            styleOne: TextStyles.font14PurpleGrayRegular,
            textTwo: "*",
            styleTwo: const TextStyle(color: ColorsManager.cerisePink),
          ),
          verticalSpace(4),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            validator: (value) {
              if (value?.isEmpty == true) {
                return LocaleKeys.Login_InvalidEmail.tr();
              } else {
                return null;
              }
            },
            suffixIcon: const Icon(Icons.visibility_outlined),
          ),
          // verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 18,
                    height: MediaQuery.of(context).size.height / 28,
                    child: Checkbox(
                      tristate: true,
                      activeColor: ColorsManager.blue,
                      value: true,
                      onChanged: (vlaue) {},
                      semanticLabel: "dsdsd",
                    ),
                  ),
                  horizontalSpace(4),
                  Text(LocaleKeys.Login_RememberMe.tr(),
                      style: TextStyles.font12PurpleGrayRegular)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
