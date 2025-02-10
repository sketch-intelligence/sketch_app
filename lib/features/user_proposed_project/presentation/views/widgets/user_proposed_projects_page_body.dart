import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model.dart';
import 'package:sketch/features/user_proposed_project/presentation/views/widgets/user_proposed_project_item.dart';
import 'package:sketch/translations.dart';

class UserProposedProjectsPageBody extends StatelessWidget {
  const UserProposedProjectsPageBody({super.key});
  static List<UserProposedProjectModel> projects = [
    UserProposedProjectModel(
      id: "1",
      title: "project 1",
      description:
          "An environmentally-conscious office complex with solar panels and green roofing.",
      numberOfBids: "2",
      author: PersonModel(name: "Beshr"),
      postDate: DateTime.now(),
      budget: "250\$",
      duration: "30 days",
      state: ProjectState.Open,
    ),
    UserProposedProjectModel(
      id: "2",
      title: "project 2",
      description:
          "An environmentally-conscious office complex with solar panels and green roofing.",
      numberOfBids: "2",
      author: PersonModel(name: "Beshr"),
      postDate: DateTime.now(),
      budget: "250\$",
      duration: "30 days",
      state: ProjectState.Open,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_12),
      child: Column(
        children: [
          BackWidget(
            onBack: () {
              context.read<RootPageCubit>().changePageIndex(0);
              GoRouter.of(context).go(AppRouter.kRootView);
            },
            title: AppLocalizations.of(context)!.latestProjects,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Expanded(
                flex: 10,
                child: SearchTextField(),
              ),
              Expanded(
                child: SvgPicture.asset(Assets.imagesFunnel),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return UserProposedProjectItem(
                  project: projects[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
