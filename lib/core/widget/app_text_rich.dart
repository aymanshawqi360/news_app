import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/theming/styles.dart';

class AppTextRich extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final TextStyle styleOne;
  final TextStyle styleTwo;

  final GestureTapCallback? onTapTextTwo;

  const AppTextRich(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.styleOne,
      required this.styleTwo,
      this.onTapTextTwo});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textOne,
            style: styleOne,
          ),
          TextSpan(
              text: textTwo,
              style: styleTwo,
              recognizer: TapGestureRecognizer()
                ..onTap = onTapTextTwo ?? () {}),
        ],
      ),
    );
  }
}
