import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_padding/app_padding.dart';
import 'package:sketch/core/constant/end_points/cashe_helper_constant.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/auth/presentation/views/widgets/sketch_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Only set firstTime to true if it doesn't exist in Hive
    if (!CacheHelper.box.containsKey(isFirstTime)) {
      CacheHelper.setFirstTime(true);
    }

    print('Direct from Hive: ${CacheHelper.box.get(isFirstTime)}');
    print('The value of firstTime is: ${CacheHelper.firstTime}');

    Timer(const Duration(seconds: 1, milliseconds: 3), () async {
      if (CacheHelper.token?.isEmpty ?? true) {
        if (CacheHelper.firstTime == true) {
          print('yess');
          GoRouter.of(context).go(AppRouter.kOnBoard);
        } else {
          print("no");
          GoRouter.of(context).go(AppRouter.kLoginView);
        }
      } else {
        GoRouter.of(context).go(AppRouter.kRootView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(child: SketchLogo()),
          Text(
            "Sketch",
            style: AppTextStyle.getBoldStyle(
                color: AppColors.black1c, fontSize: AppFontSize.size_20),
          ),
          const SizedBox(
            height: AppPaddingSize.padding_50,
          ),
        ],
      ),
    );
  }
}
