import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/features/onboarding/widget/back_and_next_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controllerPage = CarouselSliderController();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    log("stState1");
    return Scaffold(
      body: CarouselSlider(
          carouselController: controllerPage,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                page = index;
              });
            },
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: false,
            // enlargeCenterPage: true,
          ),
          items: List.generate(images.length, (index) {
            return Column(
              children: [
                Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
                verticalSpace(24.0),
                Container(
                    margin: EdgeInsets.only(left: 24.w, right: 86.w),
                    child: Column(
                      children: [
                        Text("Lorem Ipsum is simply dummy",
                            style: TextStyles.font24BlackBold),
                        verticalSpace(5.0),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          style: TextStyles.font16PurpleGrayregular,
                        ),
                      ],
                    )),
                const Spacer(),
                BackAndNextButton(
                  controller: controllerPage,
                  index: index,
                  page: page,
                ),
              ],
            );
          })),
    );
  }
}
