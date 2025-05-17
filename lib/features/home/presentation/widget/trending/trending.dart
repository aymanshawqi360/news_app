import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';
import 'package:news_app/features/home/presentation/widget/trending/widget/trending_image.dart';
import 'package:news_app/features/home/presentation/widget/trending/widget/trending_image_and_source_name_and_publishedat.dart';

class Trending extends StatefulWidget {
  final Articles listTrending;
  const Trending({super.key, required this.listTrending});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  // @override
  // void initState() {
  //   context.read<HomeNewsCubit>().getLatestNews(category: 'Sports');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrendingImage(
            articlesModel: widget.listTrending,
          ),
          verticalSpace(8),
          Text(
            "Europe",
            style: TextStyles.font13GreydarkRegular,
          ),
          verticalSpace(4),
          widget.listTrending.urlToImage!.isEmpty
              ? const Text(
                  "Russian warship: Moskva sinks in Black Sea",
                )
              : Text(
                  widget.listTrending.title!,
                  style: TextStyles.font16blackSemiBold,
                ),
          TrendingImageAndSourceNameAndPublishedat(
            articlesModel: widget.listTrending,
          )
        ],
      ),
    );
  }
}

_textShowDialog(BuildContext context, {required String error}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // title: const Text("تم إرسال البريد"),
      title: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      // Text("تم إرسال رابط تفعيل إلى بريدك الإلكتروني. يرجى التحقق لتفعيل الحساب."),
      content: Text(
        textAlign: TextAlign.center,
        error,
        style: TextStyle(fontSize: 20.sp),
      ),
      actions: [
        TextButton(
          child: const Text("حسنا"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
