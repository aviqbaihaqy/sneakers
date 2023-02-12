import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers/domain/repository.dart';
import 'package:sneakers/presentation/home/cubit/brand_state.dart';

// part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandCubit({required this.repository}) : super(InitialState()) {
    fetchBrands();
  }

  final Repository repository;

  Future<void> fetchBrands() async {
    try {
      emit(LoadingState());
      final brands = await repository.getBrands();
      emit(LoadedState(brands));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
