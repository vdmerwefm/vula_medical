import 'dart:convert';
import 'package:cli/_get_txt.dart';


class ReduceColors {
  static Future<List<String>> reduceColorsToList({String? colors}) async {
    final String favoritesContent = await GetTxt.getFavoritesTxt();

    final colorList = <String>[];

    for (final line in LineSplitter().convert(colors ?? favoritesContent)) {
      if (line.trim().isEmpty) continue;

      final favouritesList = {};

      final segment = line.split(RegExp(r'\s+'));
      final id = segment.first.trim();
      final color = segment.sublist(1).join(',').trim();

      favouritesList[id] = color;

      final String favouriteColor = favouritesList[id];
      colorList.add(favouriteColor);
    }

    return colorList.toSet().toList();
  }
}
