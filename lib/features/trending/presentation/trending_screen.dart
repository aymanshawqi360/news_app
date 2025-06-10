import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/features/trending/logic/cubit/trending_cubit.dart';
import 'package:news_app/features/trending/logic/cubit/trending_state.dart';
import 'package:news_app/features/trending/presentation/widget/list_view_trending_shimmer_loading.dart';
import 'package:news_app/features/trending/presentation/widget/the_news_trending%20.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<TrendingCubit>().getAllNewsTrending(isRefrash: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTrendingAndIconBack(context),
      body: Padding(
          padding:
              EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w, bottom: 0.h),
          child: Column(
            children: [
              BlocBuilder<TrendingCubit, TrendingState>(
                  buildWhen: (previous, current) =>
                      current is TrendingFailure ||
                      current is TrendingSuccess ||
                      current is TrendingLoading,
                  builder: (context, state) {
                    int listNews = context.read<TrendingCubit>().news.length;

                    if (state is TrendingLoading) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.listLoadinglength,
                            itemBuilder: (context, index) {
                              return const ListViewTrendingShimmerLoading();
                            }),
                      );
                    }

                    return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 10.h),
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                            physics:
                                Theme.of(context).platform == TargetPlatform.iOS
                                    ? const BouncingScrollPhysics()
                                    : const ClampingScrollPhysics(),
                            itemCount: listNews + 1,
                            itemBuilder: (context, index) {
                              debugPrint("length :${listNews}");
                              debugPrint("length+1 :${listNews + 1}");
                              debugPrint("length+2 :${listNews + 2}");
                              debugPrint("index:${index}");
                              debugPrint("length - 1:${listNews - 1}");

                              if (index < listNews) {
                                return success(context, index);
                              } else if (state is TrendingFailure) {
                                return failure();
                              } else {
                                return loading();
                              }
                            }));
                  }),
            ],
          )),
    );
  }

  Widget loading() {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          "assets/lottie/loading.json",
          width: 55.w,
          height: 55.h,
        ),
        const Text("Loading"),
      ],
    ));
  }

  Widget failure() {
    return const Center(
      child: Text("No more Data"),
    );
  }

  Widget success(BuildContext context, int index) {
    return TheNewsTrending(
        articlesModel: context.read<TrendingCubit>().news[index]);
  }

  AppBar appBarTrendingAndIconBack(BuildContext context) {
    return AppBar(
      title: const Text("Trending"),
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
      centerTitle: true,
      actions: const [Icon(Icons.more_vert_outlined)],
    );
  }
}
