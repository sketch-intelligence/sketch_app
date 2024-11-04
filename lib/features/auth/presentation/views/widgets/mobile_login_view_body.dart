import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/form_validator.dart';
import 'package:sketch/core/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:sketch/features/auth/presentation/views/widgets/login_signup_alternative.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';

class MobileLoginViewBody extends StatelessWidget {
  const MobileLoginViewBody({super.key});
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kMainPadding,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SketchLogo(),
            Text(
              'Login',
              style: AppStyles.styleBold22(context),
            ),
            const SizedBox(
              height: 26,
            ),
            CustomElevatedButton(
              onPressed: () {},
              text: 'Continue with Google',
              icon: const Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomOrDivider(),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: emailController,
              label: 'Email',
              iconPath: Assets.imagesMail,
              validator: (value) =>
                  FormValidators.validateString(value, 'Email'),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
              controller: passwordController,
              obscureText: true,
              label: 'Password',
              iconPath: Assets.imagesLock,
              validator: (value) =>
                  FormValidators.validateString(value, 'Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                }
              },
            ),
            const SizedBox(
              height: 22,
            ),
            const LoginAlternative(),
          ],
        ),
      ),
    );
  }
}
