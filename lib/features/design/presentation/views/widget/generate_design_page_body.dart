import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/dialogs/app_dialog.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/translations.dart';

class GenerateDesignPageBody extends StatelessWidget {
  const GenerateDesignPageBody({super.key});
  static TextEditingController promptController = TextEditingController();

  void _showTipDialog(BuildContext context) {
    AppCustomAlertDialog.alertDialog(
      context: context,
      widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tip',
              style: AppStyles.styleBold18(context),
            ),
            const SizedBox(height: 8),
            Text(
              'To generate images, enter a clear and detailed prompt. Include style, structure, and any specific elements you want to see.',
              style: AppStyles.styleRegular16(context),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'OK',
                  style: AppStyles.styleBold18(context)
                      .copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackWidget(
            title: AppLocalizations.of(context)!.generateDesign,
            onBack: () {
              context.read<RootPageCubit>().changePageIndex(0);
              GoRouter.of(context).go(AppRouter.kRootView);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.promptInput,
                style: AppStyles.styleBold18(context),
              ),
              IconButton(
                icon: Icon(Icons.info_outline, color: AppColors.primary),
                onPressed: () => _showTipDialog(context),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: promptController,
            hint: AppLocalizations.of(context)!.describeStructure,
            iconPath: Assets.imagesEdit,
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                child: CustomButton(
                  text: '',
                  rowChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      SvgPicture.asset(Assets.imagesButtonPlay),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        AppLocalizations.of(context)!.generate,
                        style: AppStyles.styleRegular18(context)
                            .copyWith(color: AppColors.whiteF0),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
