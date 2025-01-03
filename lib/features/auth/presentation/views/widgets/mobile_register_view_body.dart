import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/form_validator.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/presentation/views/widgets/login_signup_alternative.dart';
import 'package:sketch/features/auth/presentation/views/widgets/role_switch.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';

class MobileRegisterViewBody extends StatelessWidget {
  const MobileRegisterViewBody({super.key});
  static final TextEditingController userNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SketchLogo(),
            Text(
              'Register',
              style: AppStyles.styleBold22(context),
            ),
            const SizedBox(
              height: 26,
            ),
            CustomTextField(
              controller: userNameController,
              label: 'Username',
              iconPath: Assets.imagesUser,
              validator: (value) =>
                  FormValidators.validateString(value, 'Username'),
            ),
            const SizedBox(
              height: 12,
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
              height: 12,
            ),
            const RoleSwitch(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'Next',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  GoRouter.of(context).go(AppRouter.kRootView);
                }
              },
            ),
            const SizedBox(
              height: 22,
            ),
            const RegisterAlternative(),
          ],
        ),
      ),
    );
  }
}
