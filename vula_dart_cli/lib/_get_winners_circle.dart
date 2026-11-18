import 'package:cli/_consolidate_lists.dart';
import 'package:cli/_get_most_popular_color.dart';

class GetWinnersCircle {
  static Future<List<String>> getUsersByMostPopularColor({String? popularColor, List<ListRecord>? userRecordList}) async {
    final List<String> userList = [];
    final mostPopularColor = popularColor ?? await GetMostPopularColor.getMostPopularColor();
    final conslidatedUserList = userRecordList ?? await ConsolidateLists.consolidateListsToList();

    final voucherUsers = conslidatedUserList
        .where((user) => user.color == mostPopularColor)
        .toList();

    for (final user in voucherUsers) {
      userList.add('${user.id} ${user.name}');
    }

    return userList;
  }
}