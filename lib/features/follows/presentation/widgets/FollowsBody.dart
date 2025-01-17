import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/follows/presentation/widgets/follows_list_view.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/translations.dart';

class FollowsBody extends StatelessWidget {
  const FollowsBody({
    super.key,
    required this.users,
  });

  final List<PersonModel> users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SearchTextField(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppLocalizations.of(context)!.sortedByDateFollowed,
              ),
              SvgPicture.asset(Assets.imagesFunnel)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FollowsListView(users: users),
          ),
        ],
      ),
    );
  }
}
