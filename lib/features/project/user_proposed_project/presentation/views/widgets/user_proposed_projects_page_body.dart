import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/ui/widgets/back_widget.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';
import 'package:sketch/features/project/user_proposed_project/data/repository/projects_repository.dart';
import 'package:sketch/features/project/user_proposed_project/data/use_case/get_all_user_projects_use_case.dart';
import 'package:sketch/features/project/user_proposed_project/presentation/views/widgets/user_proposed_project_item.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/translations.dart';

class UserProposedProjectsPageBody extends StatelessWidget {
  const UserProposedProjectsPageBody({super.key});

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
            child: GetModel<ListUserProposedProjectModel>(useCaseCallBack: () {
              return GetAllUserProjectsUseCase(repository: ProjectsRepository())
                  .call(params: GetAllUserProjectsParams());
            }, modelBuilder: (model) {
              List<UserProposedProjectModel> filteredProjects =
                  model.data!.where((project) {
                if (CacheHelper.isUser ?? true) {
                  return CacheHelper.userID == project.architectId;
                }
                return true;
              }).toList();
              return ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  return filteredProjects.length == 0
                      ? Center(
                          child: Text(CacheHelper.isUser ?? true
                              ? 'You don\'t have any project!'
                              : 'No projects available'),
                        )
                      : UserProposedProjectItem(
                          project: filteredProjects[index],
                        );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
