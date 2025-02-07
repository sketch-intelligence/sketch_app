import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/data/model/login_model/login_model.dart';
import 'package:sketch/features/auth/data/repos/auth_repository.dart';
import 'package:sketch/features/auth/domain/use_case/register_use.case.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_states.dart';
import 'package:sketch/features/auth/presentation/views/widgets/login_signup_alternative.dart';
import 'package:sketch/features/auth/presentation/views/widgets/role_switch.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';
import 'package:sketch/translations.dart';

class MobileRegisterViewBody extends StatelessWidget {
   MobileRegisterViewBody({super.key});

  final _formKey = GlobalKey<FormState>();
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
                    AppLocalizations.of(context)!.register,
                    style: AppStyles.styleBold22(context),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    onChanged: (p) {
                      context.read<AuthCubit>().registerParams.userName = p;
                    },
                    label: AppLocalizations.of(context)!.username,
                    iconPath: Assets.imagesUser,
                    validator: (value) => AppValidators.validateFillFields(
                        context,
                        context.read<AuthCubit>().registerParams.userName),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onChanged: (p) {
                      context.read<AuthCubit>().registerParams.email = p;
                    },
                    label: AppLocalizations.of(context)!.email,
                    iconPath: Assets.imagesMail,
                    validator: (value) => AppValidators.validateEmailFields(
                        context,
                        context.read<AuthCubit>().registerParams.email),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
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
                    label: AppLocalizations.of(context)!.password,
                    iconPath: Assets.imagesLock,
                    onChanged: (p) {
                      context.read<AuthCubit>().registerParams.password = p;
                    },
                    validator: (value) => AppValidators.validatePasswordFields(
                        context,
                        context.read<AuthCubit>().registerParams.password),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
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
                      label: AppLocalizations.of(context)!.confirmPassword,
                      iconPath: Assets.imagesLock,
                      onChanged: (p) {
                        context
                            .read<AuthCubit>()
                            .registerParams
                            .confirmedPassword = p;
                      },
                      validator: (value) =>
                          AppValidators.validateRepeatPasswordFields(
                              context,
                              context.read<AuthCubit>().registerParams.password,
                              context
                                  .read<AuthCubit>()
                                  .registerParams
                                  .confirmedPassword)),
                  const SizedBox(
                    height: 12,
                  ),
                  const RoleSwitch(),
                  const SizedBox(
                    height: 30,
                  ),
                  CreateModel(
                    withValidation: true,
                    useCaseCallBack: (model) {
                      return RegisterUseCase(AuthRepository()).call(
                          params: context.read<AuthCubit>().registerParams);
                    },
                    onTap: () => (_formKey.currentState?.validate() ?? false),
                    onError: (val) {
                      Dialogs.showErrorSnackBar(
                          message: val,
                          context: context,
                          typeSnackBar: AnimatedSnackBarType.error);
                    },
                    onSuccess: (LoginModel model) {
                      CacheHelper.setToken(model.token);
                      CacheHelper.setUserId(model.user!.id);
                      CacheHelper.setUserInfo(model);
                      GoRouter.of(context).go(AppRouter.kRootView);
                    },
                    child: CustomButton(
                      text: AppLocalizations.of(context)!.next,
                    ),
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
