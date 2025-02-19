import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import 'package:sketch/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/features/profile/data/use_case/update_profile_pic.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  int? selectedPayment;
  TextEditingController amount = TextEditingController();
  UpdateProfilePicParams profilePicParams =
      UpdateProfilePicParams(name: CacheHelper.userInfo!.user!.name ?? '');
  PaginationCubit? getBalanceCubit;
  CreateModelCubit? add;
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
