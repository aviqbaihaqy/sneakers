import 'package:equatable/equatable.dart';
import 'package:sneakers/domain/entities/brand.dart';

abstract class BrandState extends Equatable {}

class InitialState extends BrandState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BrandState {
  @override
  List<Object> get props => [];
}

class LoadedState extends BrandState {
  LoadedState(this.brands);

  final List<Brand> brands;

  @override
  List<Object> get props => [brands];
}

class ErrorState extends BrandState {
  @override
  List<Object> get props => [];
}
