import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/action_alert_dialog.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/profile_settings/presentation/widgets/profile_card.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/translations.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingSize.padding_16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            BackWidget(
              title: AppLocalizations.of(context)!.profile_settings,
            ),
            const SizedBox(
              height: AppPaddingSize.padding_30,
            ),
            // ProfileCard(
            //     title: AppLocalizations.of(context)!.main_information,
            //     iconUrl: Assets.imagesProfile,
            //     onTap: () {
            //       context.read<ProfileCubit>().updateProfileParams =
            //           UpdateProfileParams(
            //               firstName: CacheHelper.userInfo?.firstName ?? '',
            //               secondName: CacheHelper.userInfo?.lastName ?? '',
            //               phone: CacheHelper.userInfo?.phone ?? '',
            //               phoneCode: CacheHelper.userInfo?.phoneCode ?? '',
            //               networkPhoto: CacheHelper.userInfo?.photo ?? '');
            //       Navigation.push(const UpdateProfileScreen());
            //     }),
            // ProfileCard(
            //     title: AppLocalizations.of(context)!.change_password,
            //     heightIcon: 24,
            //     widthIcon: 24,
            //     iconUrl: passwordIcon,
            //     onTap: () => Navigation.push(const ChangePasswordScreen())),
            ProfileCard(
              title: AppLocalizations.of(context)!.change_lang,
              iconUrl: Assets.imagesLang,
              onTap: () => GoRouter.of(context).push(AppRouter.kLangView),
            ),
            ProfileCard(
                title: AppLocalizations.of(context)!.balance,
                iconUrl: Assets.imagesBalanceIcon,
                onTap: () => GoRouter.of(context).push(AppRouter.kAddBalance)),
            ProfileCard(
                title: AppLocalizations.of(context)!.logout,
                iconUrl: Assets.imagesLogout,
                onTap: () {
                  ActionAlertDialog.show(context,
                      dialogTitle: AppLocalizations.of(context)!.confirm_logout,
                      confirmText: AppLocalizations.of(context)!.logout,
                      cancelText: AppLocalizations.of(context)!.cancel,
                      onConfirm: () {
                    Navigator.pop(context);
                    CacheHelper.deleteCertificates();
                    context.read<RootPageCubit>().changePageIndex(0);
                    GoRouter.of(context).go(AppRouter.kLoginView);
                  });
                }),
          ],
        ),
      ),
    ));
  }
}
