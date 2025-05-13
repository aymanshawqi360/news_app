import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/core/widget/app_list_view_list_category.dart';
import 'package:news_app/core/widget/app_text_form_field.dart';
import 'package:news_app/features/home/presentation/widget/view_news.dart';

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
          child: Column(
            children: [
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 364.w,
                      height: 183.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    "Europe",
                    style: TextStyles.font13GreydarkRegular,
                  ),
                  verticalSpace(4),
                  Text(
                    "Russian warship: Moskva sinks in Black Sea",
                    style: TextStyles.font16blackSemiBold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 15,
                          ),
                          horizontalSpace(4),
                          Text(
                            "BBC News",
                            style: TextStyles.font13greydarkSemiBold,
                          ),
                          horizontalSpace(12),
                          Icon(
                            Icons.schedule,
                            size: 14.sp,
                          ),
                          horizontalSpace(3),
                          const Text("4h ago"),
                        ],
                      ),
                      Icon(
                        Icons.more_horiz,
                        size: 14.sp,
                      )
                    ],
                  ),
                ],
              ),
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
           const    AppListViewListCategory(),
              verticalSpace(30),
              Row(
                children: [
                  Container(
                    width: 96.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6.r)),
                  ),
                  horizontalSpace(4),
                  Container(
                    color: Colors.amber,
                    width: 290.w,

                    //color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // verticalSpace(10),
                        Text("Europe", style: TextStyles.font13GreydarkRegular),
                        verticalSpace(4),
                        const Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            "Ukraine's President Zelensky to BBC: Blood money being paid..."),
                        verticalSpace(4),
                      const  ViewNews(),
            ],
          )),
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
