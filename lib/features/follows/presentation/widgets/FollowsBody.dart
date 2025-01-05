import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/follows/presentation/widgets/follows_list_view.dart';
import 'package:sketch/features/home/data/models/person_model.dart';

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
              const Text("Sorted by Date Followed : Latest"),
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
