import 'package:cli/_get_most_popular_color.dart';
import 'package:cli/_get_winners_circle.dart';

void main(List<String> arguments) {
  final getOutputs = Future.wait([
    GetMostPopularColor.getMostPopularColor(),
    GetWinnersCircle.getUsersByMostPopularColor(),
  ]);

  getOutputs.then((val) {
    final String mostPopularColor = val[0] as String;
    final List<String> winnersCircle = val[1] as List<String>;

    print('Most Popular Color is:');
    print('------------------');
    print(mostPopularColor);
    print('------------------');
    print('Voucher Winners Are:');
    print('------------------');
    for (final winner in winnersCircle) {
      print(winner);
      print('------------------');

    }
  });
}
