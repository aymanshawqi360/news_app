import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';

class LatestCashedNetworkImage extends StatelessWidget {
  final Articles articlesModel;
  const LatestCashedNetworkImage({super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: CachedNetworkImage(
        height: 96.h,
        width: 96.w,
        fit: BoxFit.cover,
        imageUrl: articlesModel.urlToImage ??
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSApAtgdXBbpiIn6crvbF3sTm_vkZq5UGOFw&s",
        placeholder: (context, url) => Container(
            width: 96.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6.r),
            )),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
