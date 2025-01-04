import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_states.dart';
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
                    'Login',
                    style: AppStyles.styleBold22(context),
                  ),
                  const SizedBox(
                    height: 26,
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
                    // obscureText: true,
                    isObscure: context.read<AuthCubit>().isObscure,
                    suffixIcon: InkWell(
                      onTap: () =>
                          context.read<AuthCubit>().changeObscurePassword(),
                      child: Icon(
                          context.read<AuthCubit>().isObscure
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
                    height: 30,
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        GoRouter.of(context).go(AppRouter.kRootView);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomOrDivider(),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: '',
                    textStyle:
                        AppTextStyle.getRegularStyle(color: Colors.black),
                    rowChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Continue with Google',
                          style: AppStyles.styleRegular18(context)
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const LoginAlternative(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
