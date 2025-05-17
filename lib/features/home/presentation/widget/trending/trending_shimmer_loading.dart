import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:redacted/redacted.dart';

class TrendingShimmerLoading extends StatelessWidget {
  const TrendingShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 364.w,
            height: 183.h,
            decoration: BoxDecoration(
              // color: Colors.grey.shade500,
              // image: DecorationImage(
              //     image: NetworkImage(state.allData[0].urlToImage ??
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSApAtgdXBbpiIn6crvbF3sTm_vkZq5UGOFw&s")),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
        verticalSpace(8),
        Text(
          "Europe",
          style: TextStyles.font13GreydarkRegular,
        ),
        verticalSpace(4),
        Text(
          "Russian warship: Moskva sinks in Black Sea",
          style: TextStyles.font16blackSemiBold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                ),
                // const CircleAvatar(
                //   radius: 15,
                // ),
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
                const Text("4h ago"),
              ],
            ),
            Icon(
              Icons.more_horiz,
              size: 14.sp,
            )
          ],
        ),
      ],
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800), //default
      ),
    );
  }
}
