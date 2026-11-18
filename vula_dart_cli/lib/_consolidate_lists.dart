import 'dart:convert';

import 'package:cli/_get_txt.dart';

typedef ListRecord = ({String id, String name, String color});

class ConsolidateLists {
  static Future<List<ListRecord>> consolidateListsToList({
    String? favorites,
    String? users,
  }) async {
    final String favoritesContent = await GetTxt.getFavoritesTxt();
    final String usersContent = await GetTxt.getUsersTxt();

    final Map<String, dynamic> favouritesList = {};
    final List<ListRecord> consolidatedlist = [];

    for (final line in LineSplitter().convert(favorites ?? favoritesContent)) {
      if (line.trim().isEmpty) continue;
      //keep looping until there is no more whitespace

      final segment = line.split(RegExp(r'\s+'));
      final id = segment.first.trim();
      final color = segment.sublist(1).join(',').trim();

      favouritesList[id] = color;
      //populate the map
    }

    for (final line in LineSplitter().convert(users ?? usersContent)) {
      final slimline = line.trimLeft();

      if (slimline.trim().isEmpty) continue;

      final segment = slimline.split(RegExp(r'\s+'));
      final id = segment.first.trim();
      final name = segment.sublist(1).join(',').trim();

      if (favouritesList.containsKey(id)) {
        final color = favouritesList[id];

        ListRecord consolidatedUser() {
          return (id: id, name: name, color: color);
        }

        consolidatedlist.add(consolidatedUser());
      }
    }

    return consolidatedlist;
  }
}
