import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_states.dart';
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
  static final TextEditingController confirmPasswordController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_30),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    validator: (value) => AppValidators.validateFillFields(
                        context, userNameController.text),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: emailController,
                    label: 'Email',
                    iconPath: Assets.imagesMail,
                    validator: (value) => AppValidators.validateEmailFields(
                        context, emailController.text),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isObscure: context.read<AuthCubit>().passwordObscure,
                    suffixIcon: InkWell(
                      onTap: () => context
                          .read<AuthCubit>()
                          .changeObscurePasswordSignUp(),
                      child: Icon(
                          context.read<AuthCubit>().passwordObscure
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye,
                          color: AppColors.primary),
                    ),
                    label: 'Password',
                    iconPath: Assets.imagesLock,
                    validator: (value) => AppValidators.validatePasswordFields(
                        context, passwordController.text),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                      controller: confirmPasswordController,
                      isObscure:
                          context.read<AuthCubit>().confirmPasswordObscure,
                      suffixIcon: InkWell(
                        onTap: () => context
                            .read<AuthCubit>()
                            .changeObscureConfirmPassword(),
                        child: Icon(
                            context.read<AuthCubit>().confirmPasswordObscure
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye,
                            color: AppColors.primary),
                      ),
                      label: 'Confirm Password',
                      iconPath: Assets.imagesLock,
                      validator: (value) =>
                          AppValidators.validateRepeatPasswordFields(
                              context,
                              passwordController.text,
                              confirmPasswordController.text)),
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
          ),
        );
      },
    );
  }
}
