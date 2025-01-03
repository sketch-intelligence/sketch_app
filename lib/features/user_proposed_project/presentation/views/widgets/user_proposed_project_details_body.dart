import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model.dart';

class UserProposedProjectDetailsBody extends StatelessWidget {
  const UserProposedProjectDetailsBody({super.key, required this.project});
  final UserProposedProjectModel project;
  static TextEditingController durationController = TextEditingController();
  static TextEditingController valueController = TextEditingController();
  static TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: SingleChildScrollView(
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
              project.description,
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
            CustomTextField(
              controller: durationController,
              hint: "Days , Months ...",
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Bid Value',
              style: AppStyles.styleRegular16(context),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: valueController,
              hint: "in USD",
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Additional Details',
              style: AppStyles.styleRegular16(context),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: detailsController,
              isBig: true,
            ),
            const SizedBox(
              height: 18,
            ),
            const CustomButton(
              text: "Submit Bid",
            ),
            const SizedBox(
              height: 18,
            ),
          ],
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
            data: project.state.toString(),
          ),
          showDetailsCardInfo(
            context,
            text: "Budget",
            data: project.budget,
          ),
          showDetailsCardInfo(
            context,
            text: "Published Since",
            date: project.postDate,
          ),
          showDetailsCardInfo(
            context,
            text: "Number of bids",
            data: project.numberOfBids,
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
