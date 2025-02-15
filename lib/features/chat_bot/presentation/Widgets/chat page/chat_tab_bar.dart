import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/translations.dart';

class ChatTabBar extends StatelessWidget {
  const ChatTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      controller: _tabController,
      tabs: [
        Tab(
          text: AppLocalizations.of(context)!.primary,
        ),
        Tab(
          text: AppLocalizations.of(context)!.chatbot,
        ),
      ],
    );
  }
}
