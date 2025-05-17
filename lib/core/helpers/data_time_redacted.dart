import 'package:timeago/timeago.dart' as timeago;

class DataTimeRedacted {
  static String dataTimeRedacted({required String formattedString}) {
    final postTime = DateTime.parse(formattedString);
    return timeago.format(postTime);
  }
}
