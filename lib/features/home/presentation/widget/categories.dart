import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

class Categories extends StatelessWidget {
  final int index;
  final int isInt;
  final String categoryText;
  const Categories(
      {super.key,
      required this.categoryText,
      required this.index,
      required this.isInt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 5.w),
      child: Column(
        children: [
          Text(categoryText,
              style: isInt == index
                  ? TextStyles.font16BlackRegular
                  : TextStyles.font16PurpleGrayRegular),
          verticalSpace(8),
          isInt == index
              ? Container(
                  height: 2.h,
                  width: 19.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.blue,
                      borderRadius: BorderRadius.circular(6.r)),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
