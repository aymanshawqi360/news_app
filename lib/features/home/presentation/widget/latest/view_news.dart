import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';
import 'package:news_app/features/home/presentation/widget/latest/widget/latest_cashed_network_image.dart';
import 'package:news_app/features/home/presentation/widget/latest/widget/latest_europe_and_title_and_source_image_and_source_name_and_icon_schedule.dart';

class ViewNews extends StatelessWidget {
  final Articles articles;

  const ViewNews({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.h),
      child: Row(children: [
        LatestCashedNetworkImage(
          articlesModel: articles,
        ),
        horizontalSpace(4),

        // color: Colors.amber,
        // color: Colors.amber,
        // constraints: BoxConstraints(
        //   maxWidth: MediaQuery.sizeOf(context).width - (260 - 96),
        // ),

        //  height: 100,

        //color: Colors.amber,

        LatestEuropeAndTitleAndSourceImageAndSourceNameAndIconSchedule(
          articlesModel: articles,
        )
      ]),
    );
  }
}
