import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/data_time_redacted.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

import 'package:news_app/features/trending/data/model/trending_response_model.dart';

class TheNewsTrending extends StatelessWidget {
  final Article articlesModel;
  const TheNewsTrending({super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: CachedNetworkImage(
                height: 183.h,
                width: 379.w,
                fit: BoxFit.cover,
                imageUrl: articlesModel.urlToImage ??
                    AppAssets.instance.imageErrorNews,
                placeholder: (context, url) {
                  return Container(
                    // width: 364.w,
                    height: 183.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: ColorsManager.lightPurpleGray),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 364.w,
                    height: 183.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAssets.instance.imageErrorNews)),
                    ),
                  );
                },
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            "Europe",
            style: TextStyles.font13GreydarkRegular,
          ),
          Text(
            articlesModel.title ?? "Russian warship: Moskva sinks in Black Sea",
            style: TextStyles.font16BlackRegular,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(articlesModel.urlToImage.toString()),
                    backgroundColor: ColorsManager.lightPurpleGray,
                    radius: 10,
                  ),
                  horizontalSpace(4),
                  Text(
                    articlesModel.source!.name ?? "BBC News",
                    style: TextStyles.font13greydarkSemiBold,
                  ),
                  horizontalSpace(12),
                  Icon(
                    Icons.schedule,
                    size: 14.sp,
                  ),
                  horizontalSpace(3),
                  Text(DataTimeRedacted.dataTimeRedacted(
                      formattedString: articlesModel.publishedAt.toString())),
                ],
              ),
              Icon(
                Icons.more_horiz,
                size: 14.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}
