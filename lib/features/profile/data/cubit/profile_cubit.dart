import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import 'package:sketch/core/classes/cashe_helper.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  int? selectedPayment;
  TextEditingController amount = TextEditingController();

  PaginationCubit? getBalanceCubit;

  dynamic balance = CacheHelper.balance;

  ProfileCubit() : super(ProfileInitialState());
  // Balance update logic
  void updateBalance(dynamic amount) {
    balance += amount; // Update the local balance
    CacheHelper.setBalance(balance); // Persist balance
    emit(UpdateState()); // Emit state to rebuild the UI
  }

  void setBalance(dynamic newBalance) {
    balance = newBalance; // Set a new balance value
    CacheHelper.setBalance(balance); // Persist balance
    emit(UpdateState()); // Emit state to rebuild the UI
  }

  updateStates() {
    emit(UpdateState());
  }
}
