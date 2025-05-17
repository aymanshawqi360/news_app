import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_cubit.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_state.dart';
import 'package:news_app/features/home/presentation/widget/trending/trending.dart';
import 'package:news_app/features/home/presentation/widget/trending/trending_shimmer_loading.dart';

class BlocBuliderAllNews extends StatefulWidget {
  const BlocBuliderAllNews({super.key});

  @override
  State<BlocBuliderAllNews> createState() => _BlocBuliderAllNewsState();
}

class _BlocBuliderAllNewsState extends State<BlocBuliderAllNews> {
  @override
  void initState() {
    context.read<HomeTrendingCubit>().getTrending();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTrendingCubit, HomeTrendingState>(
      listener: (context, state) {
        if (state is HomeAllDataFailure) {
          //   setupErrorState(context, state.message.message.toString());
          _textShowDialog(context, error: state.message.message.toString());
        }
      },
      buildWhen: (previous, current) =>
          current is HomeAllDataFailure ||
          current is HomeAllDataLoading ||
          current is HomeAllDataSuccess,
      builder: (context, state) {
        if (state is HomeAllDataSuccess) {
          return success(state);
        } else if (state is HomeAllDataFailure) {
          return failure();
        } else {
          return loading();
        }
      },
    );
  }

  Widget loading() => const TrendingShimmerLoading();

  Widget failure() {
    return Center(
        child: Lottie.asset(
      'assets/lottie/error_news.json',
      width: 150.w,
      height: 150.h,
    ));
  }

  Widget success(HomeAllDataSuccess state) =>
      Trending(listTrending: state.allData[0]);
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
          child: Text("حسنا"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
