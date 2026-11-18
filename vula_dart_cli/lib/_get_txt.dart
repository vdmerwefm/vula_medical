import 'dart:io';

class GetTxt {
  static Future<String> getFavoritesTxt() async {
    final String favoritesContent = File(
      'lib/assets/favourites.txt',
    ).readAsStringSync();

    return favoritesContent;
  }

  static Future<String> getUsersTxt() async {
    final String usersContent = File('lib/assets/users.txt').readAsStringSync();
    return usersContent;
  }
}
