import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch/core/constant/end_points/cashe_helper_constant.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/features/payment_imp/ui/payment_method.dart';
import 'package:sketch/features/profile/features/Profile/data/cubit/profile_cubit.dart';
import 'package:sketch/features/profile/features/Profile/data/cubit/profile_states.dart';
import 'package:sketch/translations.dart';

import '../../../core/constant/app_colors/app_colors.dart';
import '../../../core/constant/app_padding/app_padding.dart';
import '../../../core/constant/text_styles/app_text_style.dart';
import '../../../core/constant/text_styles/font_size.dart';
import '../../../core/ui/dialogs/dialogs.dart';
import '../../../core/ui/widgets/custom_button.dart';

class AddBalanceScreen extends StatelessWidget {
  // final VoidCallback whenSuccess;
  const AddBalanceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(AppPaddingSize.padding_16),
            child: CustomButton(
                onPressed: () {
                  if (context.read<ProfileCubit>().selectedPayment == null) {
                    Dialogs.showSnackBar(
                        context: context,
                        message: AppLocalizations.of(context)!.selectMethod,
                        typeSnackBar: AnimatedSnackBarType.error);
                  }
                },
                text: AppLocalizations.of(context)!.add),
          )),
      body: SizedBox(
          height: 1.sh,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddingSize.padding_16,
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      BackWidget(
                        title: AppLocalizations.of(context)!.addBalance,
                      ),
                      const SizedBox(
                        height: AppPaddingSize.padding_30,
                      ),
                      BlocBuilder<ProfileCubit, ProfileStates>(
                        bloc: context.read<ProfileCubit>()..amount.text = '',
                        builder: (context, state) => Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: AppColors.grey9D)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPaddingSize.padding_16),
                            child: Text(
                                '${AppLocalizations.of(context)!.yourBalance} (${context.watch<ProfileCubit>().balance.toStringAsFixed(2)}) $currency',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.getMediumStyle(
                                    color: AppColors.black1c.withOpacity(0.8),
                                    fontSize: AppFontSize.size_14)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppPaddingSize.padding_50,
                      ),
                      CustomTextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: context.read<ProfileCubit>().amount,
                        paddingTop: 12,
                        hintText: AppLocalizations.of(context)!.amount,
                        prefixIcon: Icon(Icons.attach_money_rounded,
                            color: AppColors.primary),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: AppPaddingSize.padding_50,
                              bottom: AppPaddingSize.padding_25),
                          child: Text(
                              AppLocalizations.of(context)!.selectMethod,
                              style: AppTextStyle.getBoldStyle(
                                  color: AppColors.black,
                                  fontSize: AppFontSize.size_14))),
                      const PaymentMethodsWidget(
                          // whenSuccess: whenSuccess,
                          )
                    ]),
              ))),
    ));
  }
}
