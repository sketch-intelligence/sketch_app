// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rent_chicken/core/constant/app_theme/app_styles.dart';
//
// class BottomSheetBody extends StatelessWidget {
//   final String icon;
//   final String title;
//   const BottomSheetBody({Key? key, required this.icon, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//     Container(
//     decoration: BoxDecoration(
//     color: Colors.white,
//       border: Border.all(color: AppColors.kRedLightColor),
//       borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//     ),
//     child: Padding(
//     padding: EdgeInsets.all(32),
//     child: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Row(
//       children: [
//         SvgPicture.asset(icon, width: 20.w, height: 20.h),
//         SizedBox(
//           width: 7.w,
//         ),
//         Text(
//           title,
//           style: AppTheme.montserrat.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
//         )
//       ],
//     );
//   }
// }
