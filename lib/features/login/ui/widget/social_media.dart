import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

class SocialMedia extends StatelessWidget {
  final String name;
  final String image;
  const SocialMedia({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightIceBlue,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: 24.h,
            width: 24.w,
          ),
          horizontalSpace(10),
          Text(
            name,
            style: TextStyles.font16GreydarkSemiBold,
          ),
        ],
      ),
    );
  }
}
