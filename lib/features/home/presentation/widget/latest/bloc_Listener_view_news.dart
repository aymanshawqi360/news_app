import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/home/data/model/home_response_model.dart';
import 'package:news_app/features/home/logic/cubit/home_news_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_news_state.dart';
import 'package:news_app/features/home/presentation/widget/latest/latest_shimmer_loading.dart';
import 'package:news_app/features/home/presentation/widget/latest/view_news.dart';

class BlocListenerViewNews extends StatefulWidget {
  const BlocListenerViewNews({
    super.key,
  });

  @override
  State<BlocListenerViewNews> createState() => _BlocListenerViewNewsState();
}

class _BlocListenerViewNewsState extends State<BlocListenerViewNews> {
  int isInt = 0;
  bool isLoadgin = false;
  List<Articles> dd = [];
  @override
  void initState() {
    // isLoadgin = true;
    context.read<HomeNewsCubit>().getLatestSports();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // context.read<HomeNewsCubit>().getLatestNews(category: "Sporte");
    // });
    super.initState();
  }

  List<Articles> latestList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeNewsCubit, HomeNewsState>(
          listener: (context, state) {
            if (state is HomeNewsFailure) {
              //  setupErrorState(context, state.message.message.toString());
              _textShowDialog(context, error: state.message.message.toString());
            }
          },
          buildWhen: (previous, current) =>
              current is HomeNewsLoading ||
              current is HomeNewsSuccess ||
              current is HomeNewsFailure,
          builder: (context, state) {
            if (state is HomeNewsSuccess) {
              return success(state);
            } else if (state is HomeNewsFailure) {
              return failure();
            } else if (state is HomeNewsLoading) {
              return loading();
            } else {
              return const Center(child: Text("data"));
            }
          }),
    );
  }

  Widget loading() {
    return ListView.builder(
        itemCount: latestList.length,
        itemBuilder: (context, index) {
          return latestList.isNotEmpty
              ? LatestShimmerLoading(articlesModel: latestList[index])
              : LatestShimmerLoading(
                  articlesModel: context.read<HomeNewsCubit>().ccc[index]);
        });
  }

  Widget failure() {
    return Center(
        child: Lottie.asset(
      'assets/lottie/error_news.json',
      width: 150.w,
      height: 150.h,
    ));
  }

  Widget success(HomeNewsSuccess state) {
    return ListView.builder(
        itemCount: state.listNews.length,
        itemBuilder: (context, index) {
          latestList = state.listNews;
          return ViewNews(
            articles: state.listNews[index],
          );
        });
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
          child: Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
