import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/data_constant.dart';
part 'recharge_form_state.dart';

class RechargeFormCubit extends Cubit<List<List<String>>> {
  RechargeFormCubit() : super([AppConstantData().rechargeForm]);

  void addForm(List<String> form) {
    // Create a new list with the updated state
    final updatedState = List.of(state)..add(form);
    // Emit the updated state
    emit(updatedState);
  }
}
