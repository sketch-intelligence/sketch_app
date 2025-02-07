import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/action_alert_dialog.dart';
import 'package:sketch/features/design/presentation/views/question_pages.dart';
import 'package:sketch/features/home/presentation/views/home_view.dart';
import 'package:sketch/features/profile_settings/presentation/profile_setting_view.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_state.dart';
import 'package:sketch/features/user_proposed_project/presentation/views/user_proposed_projects_page.dart';
import 'package:sketch/translations.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootPageCubit, RootPageStates>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async {
          if (context.read<RootPageCubit>().rootIndex == 0) {
            ActionAlertDialog.show(context,
                dialogTitle: "AppLocalizations.of(context)!.app_exit",
                message: "AppLocalizations.of(context)!.msg_exit",
                confirmText: "AppLocalizations.of(context)!.confirm",
                cancelText: "AppLocalizations.of(context)!.cancel",
                onConfirm: () {
              SystemNavigator.pop();
            });
          } else {
            context.read<RootPageCubit>().changePageIndex(0);
          }
          return false;
        },
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 76,
            child: BottomNavigationBar(
                elevation: 0,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Theme.of(context).colorScheme.primaryColor,
                unselectedItemColor: AppColors.grey89,
                unselectedLabelStyle: AppTextStyle.getRegularStyle(
                    color: AppColors.grey89, fontSize: AppFontSize.size_12),
                selectedLabelStyle: AppTextStyle.getRegularStyle(
                    color: Theme.of(context).colorScheme.primaryColor,
                    fontSize: AppFontSize.size_12),
                currentIndex: context.read<RootPageCubit>().rootIndex,
                onTap: (value) =>
                    context.read<RootPageCubit>().changePageIndex(value),
                items: [
                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.home,
                      icon: SvgPicture.asset(
                        Assets.imagesHome,
                        color: context.read<RootPageCubit>().rootIndex == 0
                            ? AppColors.primary
                            : AppColors.grey9A,
                        fit: BoxFit.fill,
                      )),
                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.network,
                      icon: SvgPicture.asset(
                        Assets.imagesNetwork,
                        color: context.read<RootPageCubit>().rootIndex == 1
                            ? AppColors.primary
                            : AppColors.grey9A,
                        fit: BoxFit.fill,
                      )),
                  //
                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.projects,
                      icon: SvgPicture.asset(
                        Assets.imagesConfigurationTool,
                        color: context.read<RootPageCubit>().rootIndex == 2
                            ? AppColors.primary
                            : AppColors.grey9A,
                        fit: BoxFit.fill,
                      )),
                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.generate,
                      icon: SvgPicture.asset(
                        Assets.imagesArtificialBrain,
                        color: context.read<RootPageCubit>().rootIndex == 3
                            ? AppColors.primary
                            : AppColors.grey9A,
                        fit: BoxFit.fill,
                      )),

                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.profile,
                      icon: SvgPicture.asset(
                        Assets.imagesProfile,
                        color: context.read<RootPageCubit>().rootIndex == 4
                            ? AppColors.primary
                            : AppColors.grey9A,
                        fit: BoxFit.fill,
                      )),
                ]),
          ),
          body: (context.read<RootPageCubit>().rootIndex == 0)
              ? const HomeView()
              : (context.read<RootPageCubit>().rootIndex == 1)
                  ? const SizedBox()
                  : (context.read<RootPageCubit>().rootIndex == 2)
                      ? const UserProposedProjectsPage()
                      : (context.read<RootPageCubit>().rootIndex == 3)
                          ? const QuestionPages()
                          : (context.read<RootPageCubit>().rootIndex == 4)
                              ? const ProfileSettingScreen()
                              : const SizedBox(),
        ),
      ),
    );
  }

  /// Helper method to return the correct screen based on `rootIndex`
  Widget _getBody(BuildContext context) {
    switch (context.read<RootPageCubit>().rootIndex) {
      case 0:
        return const HomeView();
      case 1:
        return SuggestedForYouPage(); // ✅ Show SuggestedForYouPage when "Network" is selected
      case 2:
        return const UserProposedProjectsPage();
      case 3:
        return const QuestionPages();
      case 4:
        return const SizedBox(); // Replace this with your Profile Page if needed
      default:
        return const HomeView();
    }
  }
}
