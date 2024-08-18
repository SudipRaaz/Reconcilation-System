import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_manager_state.dart';

class TabManagerCubit extends Cubit<int> {
  TabManagerCubit() : super(0);

  void updateTab(index) {
    emit(index);
    log(state.toString());
  }
}
