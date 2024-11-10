import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:sketch/features/notification/presentation/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: SvgPicture.asset(Assets.imagesBackArrow),
              ),
              title: Text(
                'Notifications',
                style: AppStyles.styleBold18(context),
              ),
              centerTitle: true,
            )
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const NotificationViewBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
