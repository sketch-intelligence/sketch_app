// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rent_chicken/core/constant/app_icons/app_icons.dart';

// class ImageUploaded extends StatelessWidget {
//   final File? imageFile;
//   final int index;
//   final Function whenDone;
//   const ImageUploaded(
//       {required this.imageFile,
//       super.key,
//       required this.index,
//       required this.whenDone});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topStart,
//       children: [
//         Image.file(
//           imageFile!,
//           fit: BoxFit.fill,
//           height: 270,
//           width: 100,
//         ),
//         InkWell(
//             child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset(deleteIcon),
//             ),
//             onTap: () {
//               whenDone();
//             }),
//       ],
//     );
//   }
// }
