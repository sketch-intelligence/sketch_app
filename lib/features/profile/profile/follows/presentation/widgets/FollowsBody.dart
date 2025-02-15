import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/profile/profile/follows/presentation/widgets/follows_list_view.dart';
import 'package:sketch/translations.dart';

class FollowsBody extends StatelessWidget {
  const FollowsBody({
    super.key,
    required this.users,
  });

  final List<dynamic> users;

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
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 350
                      ? AppFontSize.size_12
                      : AppFontSize.size_14,
                ),
              ),
              SvgPicture.asset(
                Assets.imagesFunnel,
                width: MediaQuery.of(context).size.width < 350 ? 16 : 20,
                height: MediaQuery.of(context).size.width < 350 ? 16 : 20,
              ),
            ],
          ),
          Expanded(
            child: FollowsListView(users: users),
          ),
        ],
      ),
    );
  }
}
