import 'package:sneakers/domain/entities/brand.dart';
import 'package:sneakers/domain/entities/sneaker.dart';

class Sneakers {
  Sneakers({
    required this.brands,
    required this.more,
  });

  List<Brand>? brands;
  List<Sneaker>? more;
}
