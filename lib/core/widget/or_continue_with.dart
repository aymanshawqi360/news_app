import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/theming/styles.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class AppOrContinueWith extends StatelessWidget {
  const AppOrContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.Login_OrcontinueWith.tr(),
        style: TextStyles.font14PurpleGrayRegular,
      ),
    );
  }
}
