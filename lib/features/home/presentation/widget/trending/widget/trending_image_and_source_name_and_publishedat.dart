import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/data_time_redacted.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

class TrendingImageAndSourceNameAndPublishedat extends StatelessWidget {
  final Articles articlesModel;
  const TrendingImageAndSourceNameAndPublishedat(
      {super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                width: 25.w,
                height: 25.h,
                fit: BoxFit.cover,
                imageUrl: articlesModel.urlToImage!,

                // fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const CircleAvatar(
                    backgroundColor: ColorsManager.blueGreyLight,
                    radius: 25,
                  );
                },
                errorWidget: (context, url, error) {
                  // return Icon(Icons.error);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      width: 25.w,
                      fit: BoxFit.cover,
                      height: 25.h,
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSApAtgdXBbpiIn6crvbF3sTm_vkZq5UGOFw&s",
                    ),
                  );
                },
              ),
            ),
            horizontalSpace(4),
            Text(
              articlesModel.source?.name ?? "BBC News",
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
    );
  }
}
