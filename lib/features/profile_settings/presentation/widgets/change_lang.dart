import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch/core/classes/keys.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/language/cubit/language_cubit.dart';
import 'package:sketch/features/language/cubit/language_states.dart';
import 'package:sketch/translations.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) => Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPaddingSize.padding_16,
              ),
              child: Form(
                key: Keys.formKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 1.sh,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.h),
                          BackWidget(
                            title: AppLocalizations.of(context)!.change_lang,
                          ),
                          const SizedBox(
                            height: AppPaddingSize.padding_30,
                          ),
                          Text(
                            AppLocalizations.of(context)!.choose_lang,
                            style: AppTextStyle.getMediumStyle(
                                fontSize: AppFontSize.size_16,
                                color: AppColors.primary),
                          ),
                          const SizedBox(
                            height: AppPaddingSize.padding_30,
                          ),
                          InkWell(
                            onTap: () => context
                                .read<LanguageCubit>()
                                .updateLanguage(lng: 'en'),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    context.read<LanguageCubit>().lang == 'en'
                                        ? AppColors.greyE5
                                        : null,
                                border: Border.all(color: AppColors.greyDD),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPaddingSize.padding_14,
                                    horizontal: AppPaddingSize.padding_25),
                                child: Text(
                                  AppLocalizations.of(context)!.english,
                                  style: AppTextStyle.getMediumStyle(
                                      fontSize: AppFontSize.size_16,
                                      color: AppColors.primary),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppPaddingSize.padding_30,
                          ),
                          InkWell(
                            onTap: () => context
                                .read<LanguageCubit>()
                                .updateLanguage(lng: 'ar'),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    context.read<LanguageCubit>().lang == 'ar'
                                        ? AppColors.greyE5
                                        : null,
                                border: Border.all(color: AppColors.greyDD),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPaddingSize.padding_14,
                                    horizontal: AppPaddingSize.padding_25),
                                child: Text(
                                  AppLocalizations.of(context)!.arabic,
                                  style: AppTextStyle.getMediumStyle(
                                      fontSize: AppFontSize.size_16,
                                      color: AppColors.black14),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          CustomButton(
                            text: AppLocalizations.of(context)!.save,
                            onPressed: () {
                              context.read<LanguageCubit>().updateAppLanguage();
                            },
                          ),
                          const SizedBox(
                            height: AppPaddingSize.padding_50,
                          )
                        ]),
                  ),
                ),
              ))),
    );
  }
}
