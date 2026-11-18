import 'package:cli/_consolidate_lists.dart';
import 'package:cli/_get_most_popular_color.dart';
import 'package:cli/_get_winners_circle.dart';
import 'package:cli/_reduce_colors.dart';
import 'package:test/test.dart';

void main() {
  final String testFavorites = '3 Green\n2 Blue\n1 Red';
  final String testUsers = '1 Bob\n2 Mary\n3 Greg';
  final List<ListRecord> testResponse = [
    (color: 'Red', id: '1', name: 'Bob'),
    (color: 'Blue', id: '2', name: 'Mary'),
    (color: 'Green', id: '3', name: 'Greg'),
  ];

  final String testFavoritesExtended =
      '1 Red\n2 Blue\n3 Blue\n4 Red\n5 Red\n6 Green\n7 Red\n8 Blue\n9 Green\n10 Blue\n11 Blue\n12 Red\n13 Green\n14 Green\n15 Blue\n16 Blue\n17 Red\n18 Green\n19 Red';
  final List<String> testColorResponse = ['Red', 'Blue', 'Green'];

  final List<ListRecord> testResponseExtended = [
    (color: 'Red', id: '1', name: 'Bob'),
    (color: 'Blue', id: '2', name: 'Mary'),
    (color: 'Green', id: '3', name: 'Greg'),
    (color: 'Green', id: '4', name: 'Sam'),
    (color: 'Blue', id: '5', name: 'Mary'),
    (color: 'Green', id: '6', name: 'Joe'),
    (color: 'Red', id: '7', name: 'Bob'),
    (color: 'Green', id: '8', name: 'Bill'),
    (color: 'Green', id: '9', name: 'Mark'),
    (color: 'Red', id: '10', name: 'Bob'),
    (color: 'Blue', id: '11', name: 'Mary'),
    (color: 'Green', id: '12', name: 'Paul'),
  ];

  final List<String> winnersCircleResponse = [
    '3 Greg',
    '4 Sam',
    '6 Joe',
    '8 Bill',
    '9 Mark',
    '12 Paul',
  ];

  group('consolidate lists tests', () {
    test('Consolidate list from static provided lists', () async {
      final consolidatedList = await ConsolidateLists.consolidateListsToList(
        favorites: testFavorites,
        users: testUsers,
      );

      expect(consolidatedList, testResponse);
    });

    test('Reduce Color list to only show single colors', () async {
      final reducedColors = await ReduceColors.reduceColorsToList(
        colors: testFavoritesExtended,
      );

      expect(reducedColors, testColorResponse);
    });

    test('Determine most popular color', () async {
      final mostPopularColor = await GetMostPopularColor.getMostPopularColor(
        listRecords: testResponseExtended,
        uniqueColors: testColorResponse,
      );

      expect(mostPopularColor, 'Green');
    });

    test('Get winners circle names', () async {
      final winnersCircle = await GetWinnersCircle.getUsersByMostPopularColor(
        popularColor: 'Green',
        userRecordList: testResponseExtended,
      );

      expect(winnersCircle, winnersCircleResponse);
    });
  });
}
