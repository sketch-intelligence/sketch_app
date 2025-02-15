import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BackWidget(
                existBack:
                    context.read<OnBoardingCubit>().index == 0 ? false : true,
                onBack: () => context
                    .read<OnBoardingCubit>()
                    .pageController
                    .previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                titleWidget: const Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.0),
                    child: SizedBox(height: 70, width: 70, child: SketchLogo()),
                  ),
                ),
              ),
            ),

            // PageView with onboarding screens
            Expanded(
              flex: 4,
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

            Expanded(flex: 2, child: _BottomSection()),
          ],
        ),
      ),
    ));
  }

  String _getImageForIndex(int index) {
    switch (index) {
      case 0:
        return Assets.imagesFirst;
      case 1:
        return Assets.imagesSecond;
      default:
        return Assets.imagesThrid;
    }
  }

  String _getTitleForIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "Showcase Your Architectural Designs";
      case 1:
        return "Generate & Enhance Designs with AI";
      default:
        return " Chat, Collaborate & Get Hired";
    }
  }

  String _getSubTitleForIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        return " Share your work with a community of architects and design enthusiasts. Get recognized and connect with potential clients.";
      case 1:
        return "Turn your ideas into stunning architectural visuals with AI. Generate new designs and discover similar concepts effortlessly.";
      default:
        return "Engage with architects, receive feedback, and explore career opportunities—all in one platform.";
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          // const Expanded(flex: 2, child: SizedBox(height: 20)),
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
            flex: 5,
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
                        maxLines: 2,
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
          InkWell(
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
                      : "Get Started",
                  textStyle: AppTextStyle.getMediumStyle(
                    color: Theme.of(context).colorScheme.secondaryColor,
                    fontSize: AppFontSize.size_16,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String _getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "Showcase Your Architectural Designs";
      case 1:
        return "Generate & Enhance Designs with AI";
      default:
        return " Chat, Collaborate & Get Hired";
    }
  }

  String _getSubtitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return " Share your work with a community of architects and design enthusiasts. Get recognized and connect with potential clients.";
      case 1:
        return "Turn your ideas into stunning architectural visuals with AI. Generate new designs and discover similar concepts effortlessly.";
      default:
        return "Engage with architects, receive feedback, and explore career opportunities—all in one platform.";
    }
  }
}
