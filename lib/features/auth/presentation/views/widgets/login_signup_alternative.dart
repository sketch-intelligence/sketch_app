import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';

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
            'Forgot Password ?',
            style: AppStyles.styleRegular16(context)
                .copyWith(color: kPrimaryColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'New user ? ',
              style: AppStyles.styleRegular16(context),
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kRegisterView);
              },
              child: Text(
                'Register here',
                style: AppStyles.styleRegular16(context)
                    .copyWith(color: kPrimaryColor),
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
          'Already have an account ? ',
          style: AppStyles.styleRegular16(context),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            'Login here',
            style: AppStyles.styleRegular16(context)
                .copyWith(color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}
