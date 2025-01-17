import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/translations.dart';

class LoginAlternative extends StatelessWidget {
  const LoginAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.forgotPassword,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: AppColors.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.newUser,
              style: AppStyles.styleRegular16(context),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
              child: Text(
                AppLocalizations.of(context)!.registerHere,
                style: AppStyles.styleRegular16(context)
                    .copyWith(color: AppColors.primary),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class RegisterAlternative extends StatelessWidget {
  const RegisterAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.alreadyHaveAccount,
          style: AppStyles.styleRegular16(context),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context)!.loginHere,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: AppColors.primary),
          ),
        )
      ],
    );
  }
}
