import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';
import 'package:sketch/features/user_proposed_project/data/repository/projects_repository.dart';
import 'package:sketch/features/user_proposed_project/data/use_case/add_bid_use_case.dart';
import 'package:sketch/translations.dart';

class UserProposedProjectDetailsBody extends StatelessWidget {
  UserProposedProjectDetailsBody({super.key, required this.project});
  final UserProposedProjectModel project;
  static TextEditingController durationController = TextEditingController();
  static TextEditingController valueController = TextEditingController();
  static TextEditingController detailsController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWidget(
                title: project.title,
              ),
              UserProposedProjectDetailsCard(
                project: project,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Project Description',
                style: AppStyles.styleBold18(context),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                project.description ?? 'no description',
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: AppColors.grey3C),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Bid',
                style: AppStyles.styleBold18(context),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Expected Duration',
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: durationController,
                hintText: "Months",
                keyboardType: TextInputType.phone,
                validator: (p) {
                  AppValidators.validatePhoneFields(
                      context, durationController.text);
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Bid Value',
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: valueController,
                hintText: "in USD",
                validator: (p) {
                  AppValidators.validatePhoneFields(
                      context, valueController.text);
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Additional Details',
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: detailsController,
                maxLines: 4,
              ),
              const SizedBox(
                height: 18,
              ),
              CreateModel(
                onSuccess: (val) {
                  Dialogs.showSnackBar(
                      message: 'Submitted Successfully', context: context);
                  GoRouter.of(context).pop();
                },
                onError: (val) {
                  Dialogs.showErrorSnackBar(
                      message: val,
                      context: context,
                      typeSnackBar: AnimatedSnackBarType.error);
                },
                useCaseCallBack: (model) {
                  return AddBidUseCase(repository: ProjectsRepository()).call(
                      params: AddBidParams(
                    projectId: project.id,
                    description: detailsController.text,
                    expectedDuration: int.parse(durationController.text),
                    price: double.parse(valueController.text),
                  ));
                },
                onTap: () => formkey.currentState?.validate() ?? false,
                withValidation: true,
                child: CustomButton(
                  text: AppLocalizations.of(context)!.submitBid,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProposedProjectDetailsCard extends StatelessWidget {
  const UserProposedProjectDetailsCard({super.key, required this.project});
  final UserProposedProjectModel project;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Column(
        children: [
          showDetailsCardInfo(
            context,
            text: "Project Status",
            data: 'Open',
          ),
          showDetailsCardInfo(
            context,
            text: "Budget",
            data: project.budget,
          ),
          showDetailsCardInfo(
            context,
            text: "Published Since",
            date: project.deadLine,
          ),
          showDetailsCardInfo(
            context,
            text: "Number of bids",
            data: project.bidDtos?.length.toString() ?? '0',
          ),
        ],
      ),
    );
  }

  Row showDetailsCardInfo(BuildContext context,
      {required String text, String? data, DateTime? date}) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              text,
              style: AppStyles.styleRegular18(context)
                  .copyWith(color: AppColors.blueFace),
            ),
          ),
        ),
        if (date != null) Expanded(child: Text(formatTime(date))),
        if (data != null)
          Expanded(
            child: Text(
              data.contains("Open")
                  ? "Open"
                  : data.contains("Closed")
                      ? "Closed"
                      : data,
              style: AppStyles.styleRegular18(context).copyWith(
                color: data.contains("Open")
                    ? AppColors.green32
                    : data.contains("Closed")
                        ? AppColors.red
                        : AppColors.black14,
              ),
            ),
          ),
      ],
    );
  }
}
