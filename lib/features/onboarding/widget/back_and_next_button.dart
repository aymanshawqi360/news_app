import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/extensions.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theming/colors.dart';
import 'package:news_app/core/theming/styles.dart';

// ignore: must_be_immutable
class BackAndNextButton extends StatefulWidget {
  int page;
  final int index;
  final CarouselSliderController controller;
  BackAndNextButton(
      {super.key,
      required this.page,
      required this.controller,
      required this.index});

  @override
  State<BackAndNextButton> createState() => _BackAndNextButtonState();
}

class _BackAndNextButtonState extends State<BackAndNextButton> {
  @override
  Widget build(BuildContext context) {
    log("setState2");
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _autoLayoutHorizontal(),
          Row(
            children: [
              widget.page == 0
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        if (widget.page <= 2) widget.page--;
                        widget.controller.animateToPage(widget.page);
                        setState(() {});
                      },
                      child: Text(
                        "Back",
                        style: TextStyles.font16LightBlueSemiBold,
                      ),
                    ),
              horizontalSpace(13),
              GestureDetector(
                onTap: () {
                  if (widget.page < 3) widget.page++;
                  widget.controller.animateToPage(widget.page);
                  if (widget.page == 3) {
                    context.pushNamedAndRemoveUntil(Routes.login,
                        predicate: (v) => false);
                  }
                  setState(() {});
                },
                child: Container(
                  width: 85.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff1877F2),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyles.font16primarywhiteColorSemiBold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _autoLayoutHorizontal() {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0.w),
            width: 14.w,
            height: 14.h,
            decoration: BoxDecoration(
                color: i == widget.page
                    ? ColorsManager.blue
                    : ColorsManager.lightPurpleGray,
                borderRadius: BorderRadius.circular(8.r)),
          ),
      ],
    );
  }
}
