import 'package:flutter/widgets.dart';
import 'package:news_app/core/theming/styles.dart';

class AppOrContinueWith extends StatelessWidget {
  const AppOrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'or continue with',
        style: TextStyles.font14PurpleGrayRegular,
      ),
    );
  }
}
