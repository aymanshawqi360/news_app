import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/data_time_redacted.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';
import 'package:redacted/redacted.dart';

class LatestShimmerLoading extends StatelessWidget {
  final Articles articlesModel;
  const LatestShimmerLoading({
    super.key,
    required this.articlesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(bottom: 16.h),
        child: Row(children: [
          Container(
            height: 96.h,
            width: 96.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
            child: Image.network(
              articlesModel.urlToImage ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSApAtgdXBbpiIn6crvbF3sTm_vkZq5UGOFw&s",
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(4),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // verticalSpace(10),
              Text("Europe", style: TextStyles.font13GreydarkRegular),
              verticalSpace(4),
              Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  articlesModel.title ??
                      "Ukraine's President Zelensky to BBC: Blood money being paid..."),
              verticalSpace(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(16.r),
                          // shape: BoxShape.circle,
                        ),
                      ),
                      horizontalSpace(4),
                      // Container(
                      //     constraints: BoxConstraints(
                      //         maxWidth: MediaQuery.sizeOf(context).width -
                      //             (91 * 3.7)),
                      //     child: Text(
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       articlesModel.source?.name ?? "BBC News",
                      //       style: TextStyles.font13greydarkSemiBold
                      //           .copyWith(fontSize: 11.sp),
                      //     )),
                      const Text("BBC News").redacted(
                        context: context,
                        redact: true,
                        configuration: RedactedConfiguration(
                          animationDuration:
                              const Duration(milliseconds: 800), //default
                        ),
                      ),
                      horizontalSpace(8),
                      Icon(
                        Icons.schedule,
                        size: 14.sp,
                      ),
                      horizontalSpace(3),
                      Text(
                          DataTimeRedacted.dataTimeRedacted(
                              formattedString:
                                  articlesModel.publishedAt.toString()),
                          style: TextStyles.font13purpleGrayRegular
                              .copyWith(fontSize: 11.sp)),
                    ],
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 16.sp,
                  )
                ],
              )
            ],
          ))
        ])).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800), //default
      ),
    );
  }
}
