import 'package:sneakers/core/utils/double.dart';

class BagSneaker {
  BagSneaker({
    required this.id,
    required this.count,
    required this.name,
    required this.image,
    required this.price,
  });

  final int id;
  int count;
  final String name;
  final String image;
  final int price;

  int get total => price * count;

  String get totalAsCurrency => total.toString(); //total.toCurrency();
}

class BagDetails {
  BagDetails({
    this.totalCount = 0,
    this.totalSum = 0,
  });

  int totalCount;
  double totalSum;

  String get totalSumAsCurrency => totalSum.toCurrency();
}
