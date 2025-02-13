// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/features/farms/cubit/farms_cubit.dart';

// import 'image_uploaded.dart';

// class UploadMedia extends StatelessWidget {
//   final VoidCallback onTap;
//   const UploadMedia({
//     super.key,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border: Border.all(
//           color: AppColors.primary,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       ),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
//           child: Row(children: [
//             SizedBox(
//               height: 100.h,
//               child: ListView.builder(
//                 itemCount: 1,
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Container(
//                         padding: const EdgeInsets.all(2),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                         child: ImageUploaded(
//                           key: const ValueKey('1'),
//                           whenDone: onTap,
//                           index: index,
//                           imageFile:
//                               context.read<FarmsCubit>().updateFarmParams.file,
//                         )),
//                   );
//                 },
//               ),
//             ),
//           ]),
//         ),
//       ),
//     ));
//   }
// }
