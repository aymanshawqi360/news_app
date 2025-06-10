import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:redacted/redacted.dart';

class ListViewTrendingShimmerLoading extends StatelessWidget {
  const ListViewTrendingShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 183.h,
              width: 379.w,
              color: Colors.grey,
            ),
            verticalSpace(8),
            Text(
              "Europe",
              style: TextStyles.font13GreydarkRegular,
            ),
            Text(
              "Russian warship: Moskva sinks in Black Sea",
              style: TextStyles.font16BlackRegular,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: context.screenWidth / 21.7,
                      height: context.screenHeight / 46,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    horizontalSpace(4),
                    Text(
                      "BBC News",
                      style: TextStyles.font13greydarkSemiBold,
                    ),
                    horizontalSpace(12),
                    Icon(
                      Icons.schedule,
                      size: 14.sp,
                    ),
                    horizontalSpace(3),
                    const Text("220255"),
                  ],
                ),
                Container(
                  width: context.screenWidth / 25,
                  height: context.screenHeight / 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ],
        ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
            )));
  }
}
