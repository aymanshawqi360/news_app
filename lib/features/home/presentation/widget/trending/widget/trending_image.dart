import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

class TrendingImage extends StatelessWidget {
  final Articles articlesModel;
  const TrendingImage({super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: CachedNetworkImage(
          width: 364.w,
          height: 183.h,
          // fit: BoxFit.cover,
          imageUrl: articlesModel.urlToImage!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
              width: 364.w,
              height: 183.h,
              decoration: BoxDecoration(
                color: ColorsManager.blueGreyLight,
                borderRadius: BorderRadius.circular(6.r),
              )),
          errorWidget: (context, url, error) => Image.asset(
                AppAssets.instance.navalShip,
                fit: BoxFit.cover,
              )
          // const Icon(
          //   Icons.error,
          //   color: Colors.red,
          // ),
          ),
    ));
  }
}
