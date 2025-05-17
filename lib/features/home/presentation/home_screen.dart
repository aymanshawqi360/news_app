import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/core/widget/app_view_list_category.dart';
import 'package:news_app/features/home/presentation/widget/latest/bloc_Listener_view_news.dart';
import 'package:news_app/features/home/presentation/widget/trending/bloc_bulider_all_news.dart';
import 'package:news_app/features/home/presentation/widget/trending/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogoAndNotifications(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [
          verticalSpace(24),
          AppTextFormField(controller: controller, validator: (vlaue) {}),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyles.font16BlackSemiBold,
              ),
              Text("See all", style: TextStyles.font14GreydarkRegular),
            ],
          ),
          verticalSpace(16),
          const BlocBuliderAllNews(),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest",
                style: TextStyles.font16BlackSemiBold,
              ),
              Text(
                "See all",
                style: TextStyles.font14GreydarkRegular,
              ),
            ],
          ),
          verticalSpace(16),
          const AppViewListCategory(),
          verticalSpace(30),
          const Expanded(child: BlocListenerViewNews())
        ]),
      ),
    );
  }

  AppBar AppBarLogoAndNotifications() {
    return AppBar(
      title: SvgPicture.asset(
        AppAssets().newsLogo,
        width: 99,
        height: 30,
      ),
      actions: [
        Container(
            margin: EdgeInsets.only(right: 24.w),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: ColorsManager.primarywhiteColor,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/n.png",
            )),
      ],
    );
  }
}

// GestureDetector(
//     onTap: () {
//       FirebaseFactory().firebaseAuth!.signOut();

//       // GoogleSignIn googleSignIn = GoogleSignIn();
//       FirebaseFactory().googleSignIn!.disconnect();
//       FirebaseFactory().facebookAuth!.logOut();

//       // googleSignIn.disconnect();

//       context.pushNamedAndRemoveUntil(Routes.login,
//           predicate: (v) => false);
//     },
//     child: const Icon(Icons.output))
