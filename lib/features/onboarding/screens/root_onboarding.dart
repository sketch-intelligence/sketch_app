import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';
import 'package:sketch/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:sketch/translations.dart';

import '../cubit/onboarding_state.dart';

class RootOnBoardingScreen extends StatelessWidget {
  const RootOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          children: [
            SizedBox(height: 50.h),
            // Common header with back button and logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BackWidget(
                onBack: () => context.read<OnBoardingCubit>().index == 0
                    ? SystemNavigator.pop()
                    : context
                        .read<OnBoardingCubit>()
                        .pageController
                        .previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                titleWidget: const Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.0),
                    child: SketchLogo(),
                  ),
                ),
              ),
            ),

            // PageView with onboarding screens
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  context.read<OnBoardingCubit>().changeIndex(index);
                },
                physics: const BouncingScrollPhysics(),
                controller: context.read<OnBoardingCubit>().pageController,
                itemBuilder: (context, index) {
                  return BaseOnboardingContent(
                    image: _getImageForIndex(index),
                    title: _getTitleForIndex(context, index),
                    subTitle: _getSubTitleForIndex(context, index),
                  );
                },
                itemCount: 3,
              ),
            ),

            Expanded(child: _BottomSection()),
          ],
        ),
      ),
    );
  }

  String _getImageForIndex(int index) {
    switch (index) {
      case 0:
        return "assets/images/images.png";
      case 1:
        return "assets/images/images.png";
      default:
        return "assets/images/images.png";
    }
  }

  String _getTitleForIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "AppLocalizations.of(context)!.onboarding1_title";
      case 1:
        return "AppLocalizations.of(context)!.onboarding2_title";
      default:
        return "AppLocalizations.of(context)!.onboarding3_title";
    }
  }

  String _getSubTitleForIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "AppLocalizations.of(context)!.onboarding1_subtitle";
      case 1:
        return "AppLocalizations.of(context)!.onboarding2_subtitle";
      default:
        return "AppLocalizations.of(context)!.onboarding3_subtitle";
    }
  }
}

class BaseOnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const BaseOnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 70.h, bottom: 40.h),
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Expanded(flex: 2, child: SizedBox(height: 20)),
          // Page indicators
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 7,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        context.read<OnBoardingCubit>().index == index
                            ? Container(
                                height: 7,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppColors.primary,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              )
                            : const CircleAvatar(
                                radius: 5,
                                backgroundColor: AppColors.greyDD,
                              ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 5),
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
          // Title and subtitle
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
                builder: (context, state) {
                  final currentIndex = context.read<OnBoardingCubit>().index;
                  return Column(
                    children: [
                      Text(
                        _getTitle(context, currentIndex),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.getBoldStyle(
                          color: AppColors.black1c,
                          fontSize: AppFontSize.size_20,
                        ),
                      ),
                      Text(
                        _getSubtitle(context, currentIndex),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.getRegularStyle(
                          color: AppColors.black1c,
                          fontSize: AppFontSize.size_12,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: InkWell(
              onTap: () async {
                if (context.read<OnBoardingCubit>().index != 2) {
                  context.read<OnBoardingCubit>().pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                } else {
                  await CacheHelper.setFirstTime(false);
                  GoRouter.of(context).go(AppRouter.kLoginView);
                }
              },
              child: BlocBuilder<OnBoardingCubit, OnBoardingStates>(
                builder: (context, state) {
                  return CustomButton(
                    color: Theme.of(context).colorScheme.primaryColor,
                    text: context.read<OnBoardingCubit>().index != 2
                        ? AppLocalizations.of(context)!.next
                        : "AppLocalizations.of(context)!.get_started",
                    textStyle: AppTextStyle.getMediumStyle(
                      color: Theme.of(context).colorScheme.secondaryColor,
                      fontSize: AppFontSize.size_16,
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await CacheHelper.setFirstTime(false);
              GoRouter.of(context).go(AppRouter.kLoginView);
            },
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: AppTextStyle.getRegularStyle(
                color: AppColors.grey9A,
                fontSize: AppFontSize.size_13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "AppLocalizations.of(context)!.onboarding1_title";
      case 1:
        return "AppLocalizations.of(context)!.onboarding2_title";
      default:
        return "AppLocalizations.of(context)!.onboarding3_title";
    }
  }

  String _getSubtitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "AppLocalizations.of(context)!.onboarding1_subtitle";
      case 1:
        return "AppLocalizations.of(context)!.onboarding2_subtitle";
      default:
        return "AppLocalizations.of(context)!.onboarding3_subtitle";
    }
  }
}
