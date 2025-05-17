import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/features/home/logic/cubit/cubit_trending/home_trending_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_news_cubit.dart';
import 'package:news_app/features/home/presentation/home_screen.dart';

class ButtonNavigationBetweenScreens extends StatefulWidget {
  const ButtonNavigationBetweenScreens({super.key});

  @override
  State<ButtonNavigationBetweenScreens> createState() =>
      _ButtonNavigationBetweenScreensState();
}

class _ButtonNavigationBetweenScreensState
    extends State<ButtonNavigationBetweenScreens> {
  List<Widget> navigationPages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeNewsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeTrendingCubit>(),
        ),
      ],
      child: const HomeScreen(),
    ),
    Container(color: Colors.red),
    Container(color: Colors.amber),
    Container(color: Colors.blue),
  ];
  int indexScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 70.h,
          color: ColorsManager.primarywhiteColor,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height / (70 - 5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Column(
                //   children: [Icon(Icons.home_outlined), Text("Home")],
                // ),

                buttonNavigation(
                  index: 0,
                  icon: Icons.home_outlined,
                  iconName: "Home",
                  // function: () {},
                ),
                // Column(
                //   children: [Icon(Icons.explore_rounded), Text("Explore")],
                // ),
                buttonNavigation(
                  index: 1,
                  icon: Icons.explore_rounded,
                  iconName: "Explore",
                  // function: () {},
                ),
                // Column(
                //   children: [Icon(Icons.bookmark_outlined), Text("Bookmark")],
                // ),
                buttonNavigation(
                  index: 2,
                  icon: Icons.bookmark_outlined,
                  iconName: "Bookmark",
                  // function: () {},
                ),
                // Column(
                //   children: [
                //     Icon(Icons.account_circle_rounded),
                //     Text("Profile")
                //   ],
                // ),
                buttonNavigation(
                  index: 3,
                  icon: Icons.account_circle_rounded,
                  iconName: "Profile",
                  // function: () {},
                ),
              ],
            ),
          ),
        ),
        body: navigationPages[indexScreen]);
  }

  Widget buttonNavigation(
      {required String iconName, required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexScreen = index;
        });
      },
      child: Column(
        children: [
          Icon(icon,
              color: indexScreen == index
                  ? ColorsManager.blue
                  : ColorsManager.black),
          Text(
            iconName,
            style: TextStyle(
                color: indexScreen == index
                    ? ColorsManager.blue
                    : ColorsManager.black),
          ),
        ],
      ),
    );
  }
}
