import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/logic/cubit/home_news_cubit.dart';
import 'package:news_app/features/home/presentation/widget/categories.dart';

class AppViewListCategory extends StatefulWidget {
  const AppViewListCategory({super.key});

  @override
  State<AppViewListCategory> createState() => _AppViewListCategoryState();
}

class _AppViewListCategoryState extends State<AppViewListCategory> {
  int isInt = 0;
  List<String> categoryNews = [
    "Sports",
    // "Politics",
    "Business",
    "Health",
    // "Travel",
    "Science",
    "General",
    "Entertainment",
    "Technology",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryNews.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isInt = index;
                      });
                      // if (categoryNews[0] == "Sports") {
                      //   context.read<HomeNewsCubit>().getLatestNews(
                      //       category: categoryNews[0].toString());
                      // } else {
                      // }
                      context.read<HomeNewsCubit>().getLatestNews(
                          category: categoryNews[index].toString());
                    },
                    child: Categories(
                      categoryText: categoryNews[index],
                      index: index,
                      isInt: isInt,
                    ),
                  ));
            }));
  }
}
