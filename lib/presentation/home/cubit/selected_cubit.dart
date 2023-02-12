import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedCubit extends Cubit<int> {
  SelectedCubit() : super(0);

  void updateIndex(value) => emit(value);
}
