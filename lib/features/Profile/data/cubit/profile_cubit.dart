import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import 'package:sketch/core/classes/cashe_helper.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  int? selectedPayment;
  TextEditingController amount = TextEditingController();

  PaginationCubit? getBalanceCubit;

  double balance = CacheHelper.balance ?? 0.0; // Add a balance property

  ProfileCubit() : super(ProfileInitialState());
  // Balance update logic
  void updateBalance(double amount) {
    balance += amount; // Update the local balance
    CacheHelper.setBalance(balance); // Persist balance
    emit(UpdateState()); // Emit state to rebuild the UI
  }

  void setBalance(double newBalance) {
    balance = newBalance; // Set a new balance value
    CacheHelper.setBalance(balance); // Persist balance
    emit(UpdateState()); // Emit state to rebuild the UI
  }

  updateStates() {
    emit(UpdateState());
  }
}
