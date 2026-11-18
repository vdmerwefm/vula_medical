import 'package:cli/_consolidate_lists.dart';
import 'package:cli/_reduce_colors.dart';

class GetMostPopularColor {
  static Future<String> getMostPopularColor({List<ListRecord>? listRecords, List<String>? uniqueColors}) async {
    final consolidatedList = listRecords ?? await ConsolidateLists.consolidateListsToList();
    final uniqueColorsList = uniqueColors ?? await ReduceColors.reduceColorsToList();
    String? mostPopularColor;
    int currentCount = 0;
    int maxCount = 0;

    for (final color in uniqueColorsList) {
      for (final userRecord in consolidatedList) {
        if (color == userRecord.color) {
          currentCount++;
        }
      }

      if (maxCount == 0 || maxCount < currentCount) {
        maxCount = currentCount;
        mostPopularColor = color;

        currentCount = 0;
      } else {
        currentCount = 0;
      }
    }

    return mostPopularColor ?? '';
  }
}