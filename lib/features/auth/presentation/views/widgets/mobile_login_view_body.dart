import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/auth/data/model/login_model/login_model.dart';
import 'package:sketch/features/auth/data/repos/auth_repository.dart';
import 'package:sketch/features/auth/domain/use_case/login_use_case.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_states.dart';
import 'package:sketch/features/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:sketch/features/auth/presentation/views/widgets/login_signup_alternative.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';
import 'package:sketch/translations.dart';

class MobileLoginViewBody extends StatelessWidget {
  MobileLoginViewBody({super.key});
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
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
                    AppLocalizations.of(context)!.login,
                    style: AppStyles.styleBold22(context),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomTextField(
                    onChanged: (p) {
                      context.read<AuthCubit>().loginParams.email = p;
                    },
                    label: AppLocalizations.of(context)!.email,
                    iconPath: Assets.imagesMail,
                    validator: (p0) => AppValidators.validateEmailFields(
                        context, context.read<AuthCubit>().loginParams.email),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
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
                    label: AppLocalizations.of(context)!.password,
                    iconPath: Assets.imagesLock,
                    onChanged: (p) {
                      context.read<AuthCubit>().loginParams.password = p;
                    },
                    validator: (p0) => AppValidators.validateFillFields(context,
                        context.read<AuthCubit>().loginParams.password),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CreateModel(
                    withValidation: true,
                    onTap: () => (_formKey.currentState?.validate() ?? false),
                    useCaseCallBack: (model) async {
                      return await LoginUseCase(AuthRepository())
                          .call(params: context.read<AuthCubit>().loginParams);
                    },
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
                      text: AppLocalizations.of(context)!.login,
                    ),
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
                          AppLocalizations.of(context)!.continueWithGoogle,
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
