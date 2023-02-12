import 'package:sneakers/domain/entities/brand.dart';
import 'package:sneakers/domain/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Brand>> getBrands() async {
    final brandRaw = await networkService.getBrands();
    return brandRaw.map((e) => Brand.fromJson(e)).toList();
  }
}
